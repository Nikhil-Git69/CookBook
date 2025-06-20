import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cookbook/recipeModel.dart';
import 'package:cookbook/recipeDetailPage.dart';


class Allrecipepage extends StatefulWidget {
  const Allrecipepage({super.key});

  @override
  State<Allrecipepage> createState() => _AllrecipepageState();
}

class _AllrecipepageState extends State<Allrecipepage> {
  final  box = Hive.box<Recipe>('Rbox');


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Color(0xFFFFF8F0),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        backgroundColor: Color(0xFF8A9A74),
        centerTitle: true,
        title: Text('All Recipes',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
      ),

        body: ValueListenableBuilder(
        valueListenable: box.listenable(),
            builder: (context, Box<Recipe> recipeBox, _) {
          if (recipeBox.isEmpty) {
        return Center(child: Text('No recipes added yet.', style: TextStyle(
          color: Color(0xFF56613A),
          fontSize: 18,
        ),
        ));
            }

               return Padding(
             padding: const EdgeInsets.all(10),
             child: ListView.builder(
          itemCount: recipeBox.length,
         itemBuilder: (context,index)
         {
           final recipe = recipeBox.getAt(index);

           return Padding(
               padding: EdgeInsets.all(10),
             child: Card(
               // color: Color(0xFF8A9A74),
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
                     '[${recipe.category}]',
                     style: TextStyle(
                       fontSize: 16,
                       color: Color(0xFF56613A),
                     ),
                   ),
                 ),
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
         }
             ),
               );
            })
    );
  }
}
