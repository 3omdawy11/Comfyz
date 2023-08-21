import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/backend/personal_data.dart';
import 'package:furniture_app/constants.dart';
import 'package:provider/provider.dart';

import '../widgets/outcome_list.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static String id = "FavoriteScreen";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PersonalData>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            size: kIconSize,
          ),
        ),
        title: const Text('Favorites',style: kAppBarTitleStyle,),
        backgroundColor: kAppBarColor,
      ),
      backgroundColor: kBackGroundColor,
      body: OutcomeList(movieList: provider.myFavorites),
    );
  }
}

