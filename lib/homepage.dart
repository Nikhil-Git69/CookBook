import 'package:cookbook/fav_page.dart';
import 'package:cookbook/support_Page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cookbook/allRecipePage.dart';
import 'package:cookbook/recipeModel.dart';
import 'package:cookbook/category_recipePage.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}





class _HomepageState extends State<Homepage> {
  final recipeBox = Hive.box<Recipe>('Rbox');


  final List<String> images = [

    'assets/Breakfast.jpeg',
    'assets/Dinner.jpeg',
    'assets/Lunch.jpeg',
    'assets/Snacks.jpeg',
    'assets/Dessert.jpeg',

  ];

  final List<String> cat = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Snacks',
    'Dessert',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F0),
      drawer: Drawer(
        backgroundColor: Color(0xFFFFF8F0),
        child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF8A9A74)),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset('assets/cookBook.png',height: 120,),


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
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FavPage()));
                      },
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
        title: Text('MY COOKBOOK',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
       ),


      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFF8A9A74),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  
                ),
        
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(15),
              color: Colors.transparent,
            child: CarouselSlider(
              options: CarouselOptions(
                height:160,
                aspectRatio:16 / 9,
                enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: 0.8,
              ),
              items: List.generate(images.length, (index) {
                return GestureDetector(
                  onTap: () {
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (
                          context, error, stackTrace) => Center(
                          child: Icon(Icons.broken_image)),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
              ],
            ),
        
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Categories: ", style:
                  TextStyle(
                    color: Color(0xFF56613A),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
            ),


            ListView.builder(
              shrinkWrap: true,
                itemCount: cat.length,
                itemBuilder: (context, index) {
                  final category = cat[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
                    child: Card(
                      color: Color(0xFF8A9A74),
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
                      ),
                      child: ListTile(
                        title: Text(category,style:
                          TextStyle(
                            color: Colors.white,
                          ),),
                            trailing: Icon(Icons.more_horiz_outlined,
                            color: Colors.white),
                        onTap: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryRecipePage(cate: category)));
                        },
                      ),
                    ),
                  );
                }

            ),


          ],
        ),
      ),
    );
  }
}
