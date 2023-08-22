import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
        required this.hintText,
        required this.onChanged,
        required this.isPassword,required this.controller});
  late var controller;
  late String hintText;
  late ValueChanged<String> onChanged;
  late bool isPassword;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        style: const TextStyle(
          color: Colors.white
        ),
        keyboardType: isPassword ? TextInputType.text : TextInputType.emailAddress,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red)
          ),
          suffixIconColor: Colors.red.shade400,
          suffixIcon: (hintText == 'Email') ? const Icon(Icons.email) : const Icon(Icons.password),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
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