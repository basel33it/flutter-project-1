import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/constants.dart';
import 'package:flutter_auth_ui/widgets/widgets.dart';

class RoundedPasswordField extends StatefulWidget {
  RoundedPasswordField({Key? key, this.passwordController}) : super(key: key);
  final TextEditingController? passwordController;

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.passwordController,
        obscureText: _obscureText,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            hintText: "Password",
            hintStyle: TextStyle(fontFamily: 'OpenSans'),
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Icon(
                  Icons.visibility_off,
                  color: Colors.grey,
                )
                    : const Icon(
                  Icons.visibility,
                ))),
        // Icon(
        //   Icons.visibility,             //   color: kPrimaryColor,
        // ),
        // border: InputBorder.none),         // Icon(
        //  Icons.visibility,         //   color: kPrimaryColor,
        // ),
      ),
    );
  }
}
