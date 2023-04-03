import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hinttext;
  final bool obscureText;
  final TextEditingController controller;
  MyTextField({
    required this.hinttext,
    required this.obscureText,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.grey,
          ))),
    );
  }
}
