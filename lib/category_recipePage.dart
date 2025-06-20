import 'package:flutter/material.dart';
import 'package:cookbook/recipeModel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cookbook/homepage.dart';
import 'package:cookbook/recipeDetailPage.dart';

class CategoryRecipePage extends StatefulWidget {
  final String cate;
  const CategoryRecipePage({super.key, required this.cate});

  @override
  State<CategoryRecipePage> createState() => _CategoryRecipePageState();
}

class _CategoryRecipePageState extends State<CategoryRecipePage> {
  var box = Hive.box<Recipe>('Rbox');

  List<dynamic> catedRecipeKeys = [];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFF8F0),
        appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 40),
          backgroundColor: Color(0xFF8A9A74),
        centerTitle: true,
        title: Text(widget.cate,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
      ),


        body: ValueListenableBuilder(
        valueListenable: box.listenable(),
    builder: (context, Box<Recipe> recipeBox, _) {

      catedRecipeKeys = box.keys.where((key) {final recipe = box.get(key);
        return recipe != null && recipe.category == widget.cate;
      }).toList();

    if (catedRecipeKeys.isEmpty) {
    return Center(child: Text('No ${widget.cate} recipes available.',style:
      TextStyle(
        color: Color(0xFF56613A),
        fontSize: 18,
      ),
    ));
    }

      return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(

            itemCount: catedRecipeKeys.length,
            itemBuilder: (context, index) {
              final key = catedRecipeKeys[index];
              final recipe = box.get(key);


              return Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.white60,
                elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Center(
                      child: Text(recipe!.recipeName,style: TextStyle(
                        color: Color(0xFF56613A),
                          fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Center(
                      child: Text(
                        recipe.category,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                    leading: GestureDetector(onTap: (){
                      final recipeKey = box.keyAt(index); Navigator.push(context, MaterialPageRoute(
                          builder: (context) => RecipeDetailPage(recipedet: recipe, recipeKey: key,)));
                    } ,
                        child: Icon(Icons.more_horiz,color: Color(0xFF56613A),)),

                    trailing: GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                          recipe.isFavorite = !recipe.isFavorite;
                          recipe.save();
                        });
                      },
                      child: Icon(recipe.isFavorite? Icons.favorite: Icons.favorite_outline_outlined,
                        color: recipe.isFavorite ? Color(0xFF56613A) : Colors.grey,),

                    ),
                  ),
                ),
              );
            }
            ),
      );
  })
    );
  }
}
