import 'package:flutter/material.dart';
class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({super.key, required this.resultsList});
  static String id = "SearchResultScreen";
  late List resultsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '${resultsList.length}',
        ),
      ),
    );
  }
}
