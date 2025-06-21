import 'package:flutter/material.dart';
import 'navPages.dart';

class landingScr extends StatefulWidget {
  const landingScr({super.key});

  @override
  State<landingScr> createState() => _landingScrState();
}

class _landingScrState extends State<landingScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8A9A74),
      body: Column(
        children: [


          Column(
            children: [
              SizedBox(height: 250),

              Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Container(
                        child: Image.asset('assets/cookBook.png',height: 150,)),
                  ),
              ),

              Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Your cooking journey...",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),),
                    ),
                  )),
SizedBox(height:70 ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100,),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: ()
                      {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(
                            builder: (context)=> navPages()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        side: BorderSide(color: Colors.white),

                      ),
                      icon: Icon(
                        Icons.book,
                        color: Colors.white,
                        size: 30,
                      ),
                      label: Text(
                        'Starts',
                        style: TextStyle(
                          fontSize: 30,
                            color: Colors.white),
                      ),
                    )

                  ),
                ),
              ),
            ],
          )


        ],

      ),

    );
  }
}
