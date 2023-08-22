import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/widgets/poster_displays/outcome_list.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({super.key, required this.resultsList});
  static String id = "SearchResultScreen";
  late List resultsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.back,size: kIconSize,),
          ),
          title: const Text('Search Results',style: kAppBarTitleStyle,),
        ),
        backgroundColor: Colors.black87,
        body: SizedBox(
            height: 6000,
            child: OutcomeList(
              movieList: resultsList,
            )));
  }
}
