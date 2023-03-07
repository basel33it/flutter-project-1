import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/constants.dart';
import 'package:flutter_auth_ui/screens/login_screen.dart';

import '../components/under_part.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              //const SizedBox(
              //  height: 1,
              //),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset('assets/images/splash_3.png',
                    height: 300, width: 400),
              ),
//زر الادخال
              FloatingActionButton.extended(
                label: Text('Get Started'),
                // <-- Text
                backgroundColor: Color.fromRGBO(94, 91, 230, 1),

                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),

              const SizedBox(
                height: 15,
              ),

              UnderPart(
                title: "Convert Natural Language  to Sql Query",
                navigatorText: "Get Started",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
