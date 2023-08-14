import 'package:flutter/material.dart';
import 'package:furniture_app/screens/dashboard.dart';
import 'package:furniture_app/screens/registeration_screen.dart';
import 'package:furniture_app/widgets/my_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'main_menu.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  var _emailController = TextEditingController();
  var _passowordController = TextEditingController();
  @override
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
              height: MediaQuery.of(context).size.height, // changed here
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
                        backgroundColor: Colors.grey.shade50,
                        color: Colors.black,
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
                      //print(value);
                    },
                    isPassword: true,
                    controller: _passowordController,
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
                              MaterialStateProperty.all(Colors.grey.shade50)),
                      onPressed: () async {
                        _emailController.clear();
                        _passowordController.clear();
                        try {
                          final user = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password);
                          print(user.toString());
                          if (user != null) {
                            Navigator.pushNamed((context), Dashboard.id);
                          }
                        } catch (e) {
                          print('Wrong username or password');
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterationScreen.id);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?..',
                            style: TextStyle(
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                              //decoration: TextDecoration.underline,
                            ),
                          ),
                          Text(
                            '  Register',
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
