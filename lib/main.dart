import 'package:flutter/material.dart';
// import 'package:univ_app/screens/login.dart';
// import 'package:univ_app/screens/splash_screen.dart';
// import 'package:univ_app/screens/nav.dart';
import 'package:univ_app/screens/splash_screen.dart';
 import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: FirebaseOptions(
    apiKey: 'AIzaSyBUKe8t9sXp5cNd4DU0FfZO6omTUDg3c2M',
    authDomain: 'hydrocare-e29d5.firebaseapp.com	',
    projectId: 'hydrocare-e29d5',
    storageBucket: 'hydrocare-e29d5.appspot.com',
    messagingSenderId: 'your_messaging_sender_id',
    appId: '1:937652675847:android:1c85d936b4b2986b5591a2',
  ), 

);
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    
    );
  }
}

