import 'package:flutter/material.dart';
import 'package:furniture_app/screens/registeration_screen.dart';
import 'screens/login_screen.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id : (context) => LoginScreen(),
        RegisterationScreen.id : (context) => RegisterationScreen(),
      },
    );
  }
}

