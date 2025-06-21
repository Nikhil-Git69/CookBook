import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cookbook/recipeModel.dart';


class EditPage extends StatefulWidget {
  final int recipeKey;
  final Recipe recipe;

  const EditPage({super.key, required this.recipeKey, required this.recipe});



  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController recipeNameController = TextEditingController();
  late TextEditingController ingredientsController = TextEditingController();
  late TextEditingController instructionsController = TextEditingController();

  String selectedCat = 'Lunch';
  final box = Hive.box<Recipe>('Rbox');
  final List<String> categories = ['Breakfast', 'Lunch', 'Dinner', 'Snacks', 'Dessert'];


  @override
  void initState() {
    super.initState();
    recipeNameController = TextEditingController(text: widget.recipe.recipeName);
    ingredientsController = TextEditingController(text: widget.recipe.ingredients);
    instructionsController = TextEditingController(text: widget.recipe.instructions);
    selectedCat = widget.recipe.category;
  }

  @override
  void dispose() {
    recipeNameController.dispose();
    ingredientsController.dispose();
    instructionsController.dispose();
    super.dispose();
  }

 Future <void> UpdatedRecipe() async {
    final utdRec = Recipe(
      recipeName: recipeNameController.text,
      ingredients: ingredientsController.text,
      instructions: instructionsController.text,
      category: selectedCat,

    );

    await box.put(widget.recipeKey, utdRec);
    Navigator.pop(context);
  }

  void ClearFields()
  {
    recipeNameController.clear();
    ingredientsController.clear();
    instructionsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        backgroundColor: Color(0xFF8A9A74),
        centerTitle: true,
        title: Text('Edit Recipe',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
      ),
      backgroundColor: Color(0xFFFFF8F0),

      body: SingleChildScrollView(
        child: Column(
          children: [


            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10, right: 10, left: 10),
              child: TextFormField(
                controller: recipeNameController,
                keyboardType: TextInputType.name,
                style: TextStyle(color: Color(0xFF56613A)),
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    label: Text('Recipe Name'),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xFF56613A)),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: ingredientsController,
                keyboardType: TextInputType.name,
                style: TextStyle(color: Color(0xFF56613A)),
                maxLines: 3,
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    label: Text('Recipe Ingredients'),

                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xFF56613A)),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: instructionsController,
                keyboardType: TextInputType.name,
                style: TextStyle(color: Color(0xFF56613A)),
                maxLines: 5,
                decoration: InputDecoration(

                    alignLabelWithHint: true,
                    label: Text('Instructions'),

                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xFF56613A)),
                    )
                ),

              ),
            ),

            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                dropdownColor: Color(0xFFFFF8F0),

                value: selectedCat,
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category, style:
                    TextStyle(
                      color: Color(0xFF56613A),
                    ),),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCat = value!;
                  });
                },
              ),
            ),

            SizedBox(height: 25),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(

                      onPressed: () async
                      {
                        await UpdatedRecipe();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8A9A74),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Update", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                    ),
                  ),

                  SizedBox(width: 30,),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()
                      {
                        ClearFields();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Color(0xFF8A9A74),
                      ),
                      child: Text("Clear",style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
