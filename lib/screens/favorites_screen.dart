import 'package:flutter/material.dart';
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  static String id = "FavoriteScreen";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Text('No favorite',style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
