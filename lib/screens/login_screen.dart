import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/components/components.dart';
import 'package:flutter_auth_ui/components/under_part.dart';
import 'package:flutter_auth_ui/constants.dart';
import 'package:flutter_auth_ui/screens/home.dart';
import 'package:flutter_auth_ui/screens/screens.dart';
import 'package:flutter_auth_ui/screens/upside2.dart';
import 'package:flutter_auth_ui/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthType { login, register }

class LoginScreen extends StatelessWidget {
  ////////////////////////////////////////////////////////////////////
  //static Future<User?> loginUsingEmailPasword({required String email, required String password , required BuildContext context})async{
  //FirebaseAuth auth = FirebaseAuth.instance;
  //User? user;
  //try {
  //UserCredential userCredential = await auth.signInWithEmailAndPassword(
  //email: email, password:password);
  //user = userCredntial.user;
  //on FirebaseAuthException catch (){
  //if (e.code == "user-not-found"){
  //print ("no user found for that email");}}
  //return user;
  // }
  //}
  //
///////////////////////////////////////////////////////////////
  //final AuthType authType;
  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> doFirebaseLogin(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
             //.then((value) => print(value.user));
      var pushReplacement = Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  Home()));
  //   } catch (error) {
  //     print("####error: $error");
  //     Dialogs.showErrorDialog(error.toString(), context);
  //   }
  // }

} on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside2(
                  imgUrl: "assets/images/login.png",
                ),
                const PageTitleBar(title: 'Login to your account'),
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
                              color: Colors.grey,
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
                              RoundedPasswordField(
                                  passwordController: passwordController),
                              switchListTile(),
                              RoundedButton(
                                  text: 'LOGIN',
                                  press: () {
                                    doFirebaseLogin(context) ;




                                   // var pushReplacement = Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Home()));

                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Don't have an account?",
                                navigatorText: "Register here",
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpScreen()));
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // const Text(
                              //   'Forgot password?',
                              //  style: TextStyle(
                              //      color: kPrimaryColor,
                              //      fontFamily: 'OpenSans',
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 13),
                              // ),
                              const SizedBox(
                                height: 20,
                              )
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

switchListTile() {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 40),
    child: SwitchListTile(
      dense: true,
      title: const Text(
        'Remember Me',
        style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
      ),
      value: true,
      activeColor: kPrimaryColor,
      onChanged: (val) {},
    ),
  );
}

iconButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      RoundedIcon(imageUrl: "assets/images/facebook.png"),
      SizedBox(
        width: 20,
      ),
      RoundedIcon(imageUrl: "assets/images/twitter.png"),
      SizedBox(
        width: 20,
      ),
      RoundedIcon(imageUrl: "assets/images/google.jpg"),
    ],
  );
}
