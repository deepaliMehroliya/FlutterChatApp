import 'package:flutter/material.dart';

import '../utils/textField_styles.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool hasAsterik;

  const LoginTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
        this.validator,
        this.hasAsterik = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hasAsterik,
      validator: (value) {
        if(validator!= null){
          return validator!(value);
        }
      },
      controller: controller,
      decoration: InputDecoration(
          hintText: 'Add your username',
          hintStyle: ThemeTextStyle.loginTextFieldStyle,
          border: OutlineInputBorder()),
    );
  }
}
