//import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/components/components.dart';
import 'package:flutter_auth_ui/components/under_part.dart';
import 'package:flutter_auth_ui/constants.dart';
import 'package:flutter_auth_ui/screens/screens.dart';
import 'package:flutter_auth_ui/widgets/confirm_password_field.dart';
import 'package:flutter_auth_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'home.dart';

//const kPrimaryColor2 = Color.fromARGB(255, 211, 210, 218);
//const kPrimaryLightColor = Color.fromARGB(255, 250, 250, 250);
final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmpasswordController = TextEditingController();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

}
class _SignUpScreenState extends State<SignUpScreen>{








    bool passwordConfirmed() {
      if (passwordController.text.trim() ==
          confirmpasswordController.text.trim()) {
        return true;
      }
      else {
        return false;
      }
    }

    // Future signUp() async {
    //   if (passwordConfirmed()) {
    //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //         email: emailController.text.trim(),
    //         password: passwordController.text.trim());
    //   }
    // }

    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery
          .of(context)
          .size;
      return SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  const Upside(
                    imgUrl: "assets/images/register.png",
                  ),
                  const PageTitleBar(title: 'Create New Account'),
                  Padding(
                    padding: const EdgeInsets.only(top: 320.0),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          iconButton(context),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "or use your email account",
                            style: TextStyle(
                                color: Color.fromARGB(255, 217, 216, 223),
                                fontFamily: 'OpenSans',
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          Form(
                            child: Column(
                              children: [
                                RoundedInputField(
                                    hintText: "Email",
                                    icon: Icons.email,
                                    textController: emailController),
                                // RoundedInputField(
                                //     hintText: "Name",
                                //     icon: Icons.person,
                                //     textController: nameController),
                                RoundedPasswordField(
                                    passwordController: passwordController),
                                RoundedConfirmPasswordField(
                                    confirmpasswordController: confirmpasswordController),
                                RoundedButton(text: 'REGISTER', press: () {
                                  doFirebasesignup(context) ;
                                }),
                                const SizedBox(
                                  height: 10,
                                ),

                                // UnderPart(
                                // title: "",
                                // navigatorText: "Already have an account?",
                                //  onTap: () {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //                 const LoginScreen()));
                                //   },
                                //  ),
                                UnderPart(
                                  title: "Already have an account?",
                                  navigatorText: "Login here",
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

Future<void> doFirebasesignup(BuildContext context) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim());
  var pushReplacement = Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Home()));
}


