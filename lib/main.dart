import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth_ui/screens/introscreen.dart';
import 'package:flutter_auth_ui/screens/login_screen.dart';
//import 'package:flutter_auth_ui/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

///////////////////////////////////////////////////////////
//fire base inite
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const MaterialApp(
              debugShowCheckedModeBanner: false, home: IntroScreen());
        }
        ;
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
/////////////////////////////////////////////////////////////////////
  //@override
 // Widget build(BuildContext context) {
   // return const MaterialApp(
//debugShowCheckedModeBanner: false, home: IntroScreen());
 // }
//}
