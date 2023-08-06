import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
        required this.hintText,
        required this.onChanged,
        required this.isPassword});

  late String hintText;
  late ValueChanged<String> onChanged;
  late bool isPassword;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                style: BorderStyle.solid
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                style: BorderStyle.solid
            ),

          ),
        ),
        onChanged: onChanged, // Use the provided onChanged function directly
        obscureText: isPassword,
      ),
    );
  }
}