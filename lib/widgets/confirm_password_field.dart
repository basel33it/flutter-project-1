import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/constants.dart';
import 'package:flutter_auth_ui/widgets/widgets.dart';

class RoundedConfirmPasswordField extends StatefulWidget {
   RoundedConfirmPasswordField({Key? key, this.confirmpasswordController})
      : super(key: key);

  final TextEditingController? confirmpasswordController;

  @override
  State<RoundedConfirmPasswordField> createState() => _RoundedConfirmPasswordFieldState();
}

class _RoundedConfirmPasswordFieldState extends State<RoundedConfirmPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.confirmpasswordController,
        obscureText: _obscureText,
        cursorColor: kPrimaryColor,
        decoration:  InputDecoration(
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            hintText: "confirm Password",
            hintStyle:  TextStyle(fontFamily: 'OpenSans'),
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
            //border: InputBorder.none
      ),

      );


  }
}
