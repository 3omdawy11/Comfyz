import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/backend/personal_data.dart';
import 'package:furniture_app/widgets/movie_list.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  static String id = "FavoriteScreen";
  PersonalData data = PersonalData();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return PersonalData();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.back,color: Colors.white,),
          ),
          backgroundColor: Colors.redAccent,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MovieList(
                    listName: 'You have ${data.myFavorites.length} Favorite',
                    moviesList: data.myFavorites,
                    horizontal: false)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
