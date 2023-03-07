import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/constants.dart';
import 'package:flutter_auth_ui/widgets/widgets.dart';

class RoundedConfirmPasswordField extends StatelessWidget {
  const RoundedConfirmPasswordField({Key? key, this.confirmpasswordController})
      : super(key: key);

  final TextEditingController? confirmpasswordController;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: confirmpasswordController,
        obscureText: true,
        cursorColor: kPrimaryColor,
        decoration: const InputDecoration(
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            hintText: "confirm Password",
            hintStyle: TextStyle(fontFamily: 'OpenSans'),
            suffixIcon: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
