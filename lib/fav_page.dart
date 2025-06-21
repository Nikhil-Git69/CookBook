import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cookbook/recipeModel.dart';
import 'package:cookbook/recipeDetailPage.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});


  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  final  box = Hive.box<Recipe>('Rbox');

  List<Recipe> favRecipe = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F0),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        backgroundColor: Color(0xFF8A9A74),
        centerTitle: true,
        title: Text('Favourite Recipes',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
      ),

      body: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box<Recipe> recipeBox, _){
            favRecipe = box.values.where((recipe) => recipe.isFavorite == true).toList();

            if (favRecipe.isEmpty) {
              return Center(child: Text('No favorite recipe availabe',style:
              TextStyle(
                color: Color(0xFF56613A),
                fontSize: 18,
              ),
              ));
            }

            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: favRecipe.length,
                itemBuilder: (context, index) {
                  final recipe = favRecipe[index];

                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      elevation: 20,
                      color: Colors.white60,
                      child: ListTile(

                        title: Center(child: Text(recipe.recipeName)),

                        subtitle: Center(child: Text('[${recipe.category}]')),

                        leading: GestureDetector(onTap: (){
                    final recipeKey = box.keyAt(index);
                    Navigator.push(context, MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(recipedet: recipe, recipeKey: recipeKey,)));
                    } ,
                        child: Icon(Icons.more_horiz, color: Color(0xFF56613A),)),

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
                },
              ),
            );
          }),
    );
  }
}
