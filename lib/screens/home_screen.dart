import 'package:flutter/material.dart';
// import 'package:univ_app/screens/register.dart';
import 'package:univ_app/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:univ_app/screens/signup.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}

 class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
 }
 

class _HomeState extends State<Home> {
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
int _success = 1;
String _userEmail = "";

void _signIn() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      final User user = userCredential.user!;

      setState(() {
        _success = 2;
        _userEmail = user.email!;
      });

      // Navigate to the new page after successful login
      _navigateToNewPage();
    } catch (e) {
      setState(() {
        _success = 3;
      });
      print('Error during sign in: $e');
    }
  }

  void _navigateToNewPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Lagin(), // Replace with the actual new page widget
      ),
    );
  }



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
                child: Text("Make you water",
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
              SizedBox (
                height: 5,
              ),
              Container (
                alignment: Alignment(1,0),
                padding: EdgeInsets.only(top:15,left:20),
                child: InkWell(
               child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  decoration:TextDecoration.underline
                ),
               ),   
                ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text (
                    _success == 1
                    ? ''
                    : (
                      _success == 2
                      ? 'Successfully Signed in' + _userEmail
                      : 'Sign In Failed' 
                    ),
                    style: TextStyle(color: Colors.red),
                  ),
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
                        _signIn();

                      },
                      child: Center(
                        child: Text('Login',
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
                        Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => SignupPage())),
                        );
                      },
                      child: Text(
                        'Register',
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
  }}
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
    
//     return MaterialApp( 
       
//         home: LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   Future<void> _login() async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//       print("User logged in: ${userCredential.user!.email}");
//       // Navigate to the next screen or perform other actions after successful login
//     } on FirebaseAuthException catch (e) {
//       print("Login failed: ${e.message}");
//       // Handle login errors, e.g., display an error message to the user
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//             SizedBox(height: 32),
//             ElevatedButton(
//                style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.all(20.20), // Adjust the padding as needed
//                 ),
                
//             onPressed: () {
//              Navigator.push (context,  MaterialPageRoute(
//                 builder: ((context) =>  Lagin())));},
//               child: Text('Log In'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  //     backgroundColor: Colors.transparent,
  //   body: Center(
  //    child: Padding(
    
  //         padding: EdgeInsets.symmetric(vertical: 49, horizontal: 90),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
            
  //           children: [
  //           Image(image:AssetImage('assets/splash 5.jpg') ,),
  //            SizedBox(
  //               height: 2,
  //             ),
  //             Text("Make you Water!"),
           

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
  //               hintText: "Enter Password",
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
  //           SizedBox(
  //              width: 16.0, // Adds horizontal space
  //              height: 8.0,), // Adds vertical space
  //          ElevatedButton(
  //            style: ElevatedButton.styleFrom(
  //                 padding: EdgeInsets.all(20.20), // Adjust the padding as needed
  //               ),
                
  //           onPressed: () {
  //            Navigator.push (context,  MaterialPageRoute(
  //               builder: ((context) =>  Login())),
  //            );
             
  //          },
               
  //               child: Text('Login'),
  //             )
        
  //         ],
          
           
  //         ),)));
  // }}
  