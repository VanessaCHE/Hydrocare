import 'package:flutter/material.dart';
import 'package:univ_app/screens/nav.dart';


class SplashScreen extends StatelessWidget {
  

  @override
  Widget build (BuildContext context) {
   Future.delayed(const Duration(seconds:5),(){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context)  => Nav())
        );
   
   });
      return Scaffold(
           backgroundColor: Colors.transparent,
           body: Container(
             width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.network(
          'assets/Blue Modern Water Company Logo Type (1).png',
          fit: BoxFit.cover,

           ),
           
   )); }}
   