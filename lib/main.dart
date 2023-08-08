import 'package:flutter/material.dart';
import 'package:furniture_app/screens/registeration_screen.dart';
import 'package:furniture_app/screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashTransition: SplashTransition.fadeTransition,
          splash: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Comfyz',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'DancingScript',
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          nextScreen: LoginScreen()),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterationScreen.id: (context) => RegisterationScreen(),
      },
    );
  }
}
