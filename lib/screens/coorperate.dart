import 'package:flutter/material.dart';
import 'package:univ_app/screens/water.dart';

class Coorp extends StatelessWidget {
  const Coorp({super.key});

  @override
  Widget build(BuildContext context) {
   

 return Scaffold (
  appBar: AppBar(
        title: Text('Register your Company'),),
  
      backgroundColor: Colors.transparent,
    body:  Center(
     child: Padding(
    
          padding: EdgeInsets.symmetric(vertical: 49, horizontal: 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
            Image(image:AssetImage('assets/splash 5.jpg') ,),
             
            TextField(
              
              decoration: InputDecoration(
                hintText: "Enter Company Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 2,
            ),
           
          
            TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
            TextField(
                        decoration: InputDecoration(
                          hintText: "Re-enter Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
             SizedBox(
                        width: 16.0, // Adds horizontal space
                        height: 8.0,
                      ), // Adds vertical space
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(
                              20.20), // Adjust the padding as needed
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: ((context) => Water())),
                          );
                        },
                        child: Text('Register'),
                      )
          
            ]
          )))
 );
  }}