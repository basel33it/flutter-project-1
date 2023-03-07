import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/constants.dart';

import '../screens/home.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key, this.press, this.textColor = Colors.white, required this.text})
      : super(key: key);
  final String text;
  final Function()? press;
  final Color? textColor;

  get context => null;

  // doFirebaseLogin(BuildContext context) async {
  //   // 1- We need to check if this account exist in the database
  //   // IF NOT do log in
  //   // ELSE you can login
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .where('user_id', isEqualTo: emailController.text)
  //       .get()
  //       .then((value) => {
  //     if (value.size > 0)
  //       {Dialogs.showErrorDialog("already_exist", context)}
  //     else
  //       {doSecondStep(context)}
  //   });
  // }
  // doSecondStep(BuildContext context) async {
  //   try {
  //     await Provider.of<Auth>(context, listen: false)
  //         .loginFirebase(emailController.text, passwordController.text);
  //     // .then((value) => addUserToDataBase(emailController.text));
  //
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (_) => BillPage()));
  //   } catch (error) {
  //     print("####error: $error");
  //     Dialogs.showErrorDialog(error.toString(), context);
  //   }
  // }




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),

      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor,fontSize: 17),
      ),
      onPressed: press

      ,
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
        textStyle: TextStyle(
          letterSpacing: 2,
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans'
        )
      ),
    );
  }




}
