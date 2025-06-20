  import 'package:flutter/material.dart';
  import 'package:cookbook/recipeModel.dart';
  import 'package:hive_flutter/hive_flutter.dart';
  import 'package:fluttertoast/fluttertoast.dart';

  class RecipeDetailPage extends StatefulWidget {

    final Recipe recipedet;

    const RecipeDetailPage({super.key, required this.recipedet});

    @override
    State<RecipeDetailPage> createState() => _RecipeDetailPageState();
  }


  class _RecipeDetailPageState extends State<RecipeDetailPage> {

    var box = Hive.box<Recipe>('Rbox');

    Future<void> DeleteRecipe(Recipe recipedet) async {
      final KeytoDelete = box.keys.firstWhere((key) => box.get(key) == recipedet,
        orElse: () => null,
      );

      if (KeytoDelete != null)
        {
          await box.delete(KeytoDelete);

          Fluttertoast.showToast(msg: "Recipe Deleted");


        }
      else
        {

          Fluttertoast.showToast(msg: "Recipe Not found");
        }

    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Recipe Detail", style: TextStyle(
            color: Colors.white,
          ),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white ),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [




                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,left: 20, right: 20, bottom: 5),
                            child: Text(
                              "Name: ${widget.recipedet.recipeName}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 20, ),
                          child: Text(
                              "Category: [${widget.recipedet.category}]",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),


                    Divider(),

                        Text("Ingredients:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),

                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10,right: 10),
                          child: Text(widget.recipedet.ingredients,style:
                            TextStyle(
                              fontSize: 16,
                            ),),
                        ),

                        SizedBox(height: 10),

                        Divider(),

                        Text("Instructions:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10, top: 10,bottom: 20),
                          child: Text(widget.recipedet.instructions, style:
                            TextStyle(
                              fontSize: 16,
                            ),),
                        ),
                      ],
                    ),
                  ),

                ),
              ),

              SizedBox(height: 50,),

              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(

                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("Edit", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(

                    onPressed: () async{
                      showDialog(context: context,
                          barrierDismissible: false,
                          builder: (builder)=>Center(child: CircularProgressIndicator()),
                      );
                      await Future.delayed(Duration(milliseconds: 100));

                      await DeleteRecipe(widget.recipedet);


                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("Delete", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
    }
  }
