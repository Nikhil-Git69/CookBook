import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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


      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 40),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset('assets/cookBook.png',
        height: 40,),


      ),

      body: Stack(
        children: [


          Container(
            
          ),
        ],
      ),
    );
  }
}
