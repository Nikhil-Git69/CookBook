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

List<Recipe> catedRecipe = [];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        backgroundColor: Colors.black,
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

          catedRecipe = box.values.where((recipe) => recipe.category == widget.cate ).toList();

    if (catedRecipe.isEmpty) {
    return Center(child: Text('No ${widget.cate} recipes available.'));
    }

      return ListView.builder(

          itemCount: catedRecipe.length,
          itemBuilder: (context, index) {
            final recipe = catedRecipe[index];

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
                    child: Text(recipe.recipeName,style: TextStyle(
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
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => RecipeDetailPage(recipedet: recipe)));
                  } ,
                      child: Icon(Icons.more_horiz)),

                  trailing: Icon(Icons.favorite),
                ),
              ),
            );
          }
          );
  })
    );
  }
}
