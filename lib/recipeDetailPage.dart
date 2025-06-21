  import 'package:flutter/material.dart';
  import 'package:cookbook/recipeModel.dart';
  import 'package:hive_flutter/hive_flutter.dart';
  import 'package:fluttertoast/fluttertoast.dart';
  import 'package:cookbook/edit_page.dart';

  class RecipeDetailPage extends StatefulWidget {

    final Recipe recipedet;

    final int recipeKey;


    const RecipeDetailPage({super.key, required this.recipedet, required this.recipeKey});

    @override
    State<RecipeDetailPage> createState() => _RecipeDetailPageState();
  }


  class _RecipeDetailPageState extends State<RecipeDetailPage> {

    var box = Hive.box<Recipe>('Rbox');




    Future<void> DeleteRecipe(int keyToDelete) async {
      try {
        await box.delete(keyToDelete);
        Fluttertoast.showToast(msg: "Recipe Deleted");
      } catch (e) {
        Fluttertoast.showToast(msg: "Error ");
      }
    }

    Future<bool?>DeleteDialog () async {
     return showDialog(context: context,
          barrierDismissible: false,
          builder: (_) => AlertDialog(
            title: Text("CONFIRM DELETE"),
            content: Text("Do you really wish to delete this recipe?"),
            actions: [

              ElevatedButton(onPressed: () async
              {
                Navigator.pop(context, true);
              },
                  child: Text("Yes")),

              ElevatedButton(onPressed: ()
              {
                Navigator.pop(context);
              },
                  child: Text("No")),
            ],

          )
      );
    }

    @override
    Widget build(BuildContext context) {
      final Recipe? recipe = box.get(widget.recipeKey);

      if (recipe == null) {
        return Scaffold(

          appBar: AppBar(
            title: Text("Recipe Detail", style: TextStyle(
              color: Colors.white,
            ),),
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white, size: 40 ),
            backgroundColor: Color(0xFF8A9A74),
          ),
          body: Center(child: Text("Recipe not found")),
        );
      }

      return Scaffold(
        backgroundColor: Color(0xFFFFF8F0),
        appBar: AppBar(
          title: Text("Recipe Detail", style: TextStyle(
            color: Colors.white,
          ),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white, size: 40 ),
          backgroundColor: Color(0xFF8A9A74),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    color: Color(0xFF8A9A74),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [




                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,left: 20, right: 20, bottom: 5),
                            child: Text(
                              "Name: ${recipe.recipeName}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 20, ),
                          child: Text(
                              "Category: [${recipe.category}]",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),


                    Divider(),

                        Text("Ingredients:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20, fontWeight: FontWeight.bold)),

                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10,right: 10),
                          child: Text(recipe.ingredients,style:
                            TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),),
                        ),

                        SizedBox(height: 10),

                        Divider(),

                        Text("Instructions:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10, top: 10,bottom: 20),
                          child: Text(recipe.instructions, style:
                            TextStyle(
                              color: Colors.white,
                              fontSize: 18,
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

                    onPressed: () async {

                     await Navigator.push(context, MaterialPageRoute(
                          builder: (context) => EditPage(recipeKey: widget.recipeKey, recipe: recipe)),
                     );
                     setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8A9A74),
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
                      final confirm = await DeleteDialog();

                      if (confirm ==true)
                        {
                          await DeleteRecipe(widget.recipeKey);
                          setState(() {});
                          if (mounted) Navigator.pop(context);
                        }

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8A9A74),
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
