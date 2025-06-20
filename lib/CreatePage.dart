import 'package:cookbook/support_Page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'recipeModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'allRecipePage.dart';

class createPage extends StatefulWidget {
  const createPage({super.key});

  @override
  State<createPage> createState() => _createPageState();
}

class _createPageState extends State<createPage> {
   final TextEditingController recipeNameController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
    final TextEditingController instructionsController = TextEditingController();

   final List<String> categories = ['Breakfast', 'Lunch', 'Dinner', 'Snacks', 'Dessert'];

   String? selectedCategory = 'Lunch';


   var box = Hive.box<Recipe>('Rbox');



void ClearFields(){
   recipeNameController.clear();
   ingredientsController.clear();
   instructionsController.clear();
}

Future<void> SaveRecipe() async {
  if (recipeNameController.text.isEmpty || ingredientsController.text.isEmpty ||
      instructionsController.text.isEmpty || selectedCategory == null)
  {
    Fluttertoast.showToast(msg: "Please fill out all the forms");
    return;
  }

  var newRecipe = Recipe(
    recipeName: recipeNameController.text,
    ingredients: ingredientsController.text,
    instructions: instructionsController.text,
    category: selectedCategory!,
  );

    await box.add(newRecipe);

  ClearFields();
  Fluttertoast.showToast(msg: "Recipe Saved");


}

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xFFFFF8F0),
        child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF8A9A74)),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset('assets/cookBook.png',height: 80,),


                    ),
                  ],
                ),

              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Allrecipepage()));
                      },
                      leading: Icon(Icons.menu_book, color: Color(0xFF56613A),),
                      title: Text('All Recipes',style: TextStyle(
                        color: Color(0xFF56613A),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),

                    ),    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.favorite, color: Color(0xFF56613A)),
                      title: Text('Favorites',style: TextStyle(
                        color: Color(0xFF56613A),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),

                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context)=> SupportPage()));
                      },
                      leading: Icon(Icons.support_agent_sharp, color: Color(0xFF56613A)),
                      title: Text('Contact Us',style: TextStyle(
                        color: Color(0xFF56613A),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),

                    ),
                    ListTile(
                      onTap: (){},
                      leading: Icon(Icons.settings, color: Color(0xFF56613A)),
                      title: Text('Settings',style: TextStyle(
                        color: Color(0xFF56613A),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),

                    ),
                  ],
                ),
              ),



            ]
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        backgroundColor: Color(0xFF8A9A74),
        centerTitle: true,
        title: Text('Add a Taste of You',
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
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    label: Text('Recipe Name'),
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: ingredientsController,
                keyboardType: TextInputType.name,
                maxLines: 3,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  label: Text('Recipe Ingredients'),

                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: instructionsController,
                keyboardType: TextInputType.name,
                maxLines: 5,
                decoration: InputDecoration(
        
                  alignLabelWithHint: true,
                  label: Text('Instructions'),

                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
        
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

                value: selectedCategory,
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
                    selectedCategory = value;
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
                        await SaveRecipe();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8A9A74),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Save", style: TextStyle(
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
