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
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black87)
          ),
          suffixIconColor: Colors.black87,
          suffixIcon: (hintText == 'Email') ? const Icon(Icons.email) : const Icon(Icons.password),
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