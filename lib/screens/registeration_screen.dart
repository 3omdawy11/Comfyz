import 'dart:async';

import 'package:flutter/material.dart';
import 'package:furniture_app/screens/main_menu.dart';
import 'package:furniture_app/widgets/my_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});
  static String id = 'RegisterationScreen';

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  @override
  late String email;
  late String password;
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/loginMoviebackground.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              //decoration: kLoginBorderDesign,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Comfyz\n'
                    'Where comfort is found',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        backgroundColor: Colors.grey,
                        fontSize: 30,
                        fontFamily: 'DancingScript'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    hintText: 'Email',
                    onChanged: (value) {
                      email = value;
                      //print(email);
                    },
                    isPassword: false,
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    hintText: 'Password',
                    onChanged: (value) {
                      password = value;
                    },
                    isPassword: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey)),
                      onPressed: () async {
                        _emailController.clear();
                        _passwordController.clear();
                        try {
                          final newUser = await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null){
                            Navigator.pushNamed((context), MainMenu.id);
                          }
                        } catch (e) {
                          print("Please Enter a username and a password");
                        }
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
