import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController messageController = TextEditingController();



void validation(){
  if(nameController.text.isEmpty || emailController.text.isEmpty ||
      contactController.text.isEmpty || messageController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "Please fill out all the forms");
    }
  else
    {

      Fluttertoast.showToast(msg: "Message Sent");
      clearField();
    }
}

void clearField()
{
  nameController.clear();
  emailController.clear();
  contactController.clear();
  messageController.clear();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8F0),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
            size: 40,
        ),
        centerTitle: true,
        title: Text("Contact Us",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
        backgroundColor: Color(0xFF8A9A74),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10,25,10,10),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Full Name',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(

                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: contactController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Contact No',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),

                  ),


                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                maxLines: 5,
                controller: messageController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(onPressed: ()
            {
              validation();

            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8A9A74),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Confirm",style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,


                ),)),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFD8E0C3),
                  borderRadius: BorderRadius.circular(20),
                ),

                height: 175,
                width: double.infinity,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Contact Info",style:
                      TextStyle(
                          color: Color(0xFF56613A),
                          fontWeight: FontWeight.bold, fontSize: 20
                      ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(5),
                      child: Row(
                          children: [
                            Icon(Icons.location_on, color: Color(0xFF56613A)),
                            SizedBox(width: 10),
                            Text("Devkota Sadak, Mid-Baneswor, Kathmandu",
                              style: TextStyle(
                                color: Color(0xFF56613A),
                              ),
                            ),
                          ]
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.all(5),
                      child: Row(
                          children: [
                            Icon(Icons.phone, color: Color(0xFF56613A)),
                            SizedBox(width: 10),
                            Text("Kathmandu: (+977) 9840633571",
                              style: TextStyle(
                                  color: Color(0xFF56613A),
                              ),
                            ),
                          ]
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                          children: [
                            Icon(Icons.email, color: Color(0xFF56613A)),
                            SizedBox(width: 10),
                            Text("Nikhil.Nagarkoti021@ApexCollege.edu.np",
                              style: TextStyle(
                                color: Color(0xFF56613A),
                              ),
                            ),
                          ]
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );;
  }
}
