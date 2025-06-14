import 'package:flutter/material.dart';

class createPage extends StatefulWidget {
  const createPage({super.key});

  @override
  State<createPage> createState() => _createPageState();
}

class _createPageState extends State<createPage> {
   final TextEditingController recipeNameController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
    final TextEditingController instructionsController = TextEditingController();

   final List<String> categories = ['Breakfast', 'Lunch', 'Dinner', 'Snacks', 'Dessert', 'Others'];
   String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
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
                      onTap: () {},
                      leading: Icon(Icons.menu_book),
                      title: Text('All Recipes',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),

                    ),    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.favorite),
                      title: Text('Favorites',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),

                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.support_agent_sharp),
                      title: Text('Contact Us',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),

                    ),
                    ListTile(
                      onTap: (){},
                      leading: Icon(Icons.settings),
                      title: Text('Settings',style: TextStyle(
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Add a Taste of You',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),),
      ),
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
                    hintText: 'Enter your Recipe Name',
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
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  label: Text('Recipe Ingredients'),
                  hintText: 'Enter your Recipe Ingredients',
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
                  hintText: 'Enter Your Recipe Instructions..',
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
                value: selectedCategory,
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
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

                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
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
                  SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()
                      {
                      recipeNameController.clear();
                      ingredientsController.clear();
                      instructionsController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.red,
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
