import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
   bool _success = false;
   late String _userEmail;
   
   Future<void> _signup() async {
     try{
       
      final UserCredential userCredential = (
      await _auth.createUserWithEmailAndPassword(email: _emailController.text,
       password: _passwordController.text)
      
      );
      final User user = userCredential as User;

       
      // ignore: unnecessary_null_comparison
        setState(() {
        _success = true;
        _userEmail = user.email!;
      });
    } catch (e) {
      setState(() {
        _success = false;
      });
      print('Error during sign up: $e');
    }
  }
  //     print("User logged in: ${user.user!.email}");
  //     // Navigate to the next screen or perform other actions after successful login
  //   } on FirebaseAuthException catch (e) {
  //     print("Login failed: ${e.message}");
  //     // Handle login errors, e.g., display an error message to the user
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            Container(
          child: Stack(
            children: <Widget>[
              
          Container(
                padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                child: Text("Sign Up",
                style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold
                ),)
              )
            ],
          ),
            ),
        Container(
          padding: EdgeInsets.only(top: 35, left: 20, right: 30),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                     )
                ),
              ),
              SizedBox(height: 20,),
              
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                    )),
                    obscureText: true,
              ),
             
                SizedBox(height: 40,),
                Container(
                  height: 40,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.blue,
                    color: Colors.black,
                    elevation: 7,
                    child: GestureDetector(
                      onTap: () async{
                        _signup();
                      },
                      child: Center(
                        child: Text('Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'
                        )
                      ),),
                    ),
                  ),
                ),
            
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Go Back',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline
                        ),
                      ),
                    )
                  ],
                )
            ],
          ),
        )
        ],
        
      ));
  
  }
}
  

  // @override
  // Widget build(BuildContext context) {
  //   return  Scaffold(
  //     backgroundColor: Colors.transparent,
  //      body: const Center(
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(vertical: 49, horizontal: 90),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
            
  //           children: [
  //           Image(image:AssetImage('assets/splash 5.jpg') ,),
            
  //           TextField(
  //             decoration: InputDecoration(
  //               hintText: "Enter Username",
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 4,
  //           ),
  //           // Adjust the width as needed
  //           TextField(
  //             decoration: InputDecoration(
  //               hintText: "Enter Email",
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
  //           TextField(
  //             decoration: InputDecoration(
  //               hintText: "Renter Password",
  //               border: OutlineInputBorder(),
  //             ),),
  //              TextField(
  //             decoration: InputDecoration(
  //               hintText: "Renter Password",
  //               border: OutlineInputBorder(),
  //             ))
            
  //         ],
          
  //       ),
  
  //       )   
  //      ));
  //      }
      
  
  

//constructors are used to initiallize everything in the class