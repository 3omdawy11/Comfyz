import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/backend/movie_model.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/widgets/selection_tab.dart';


late User loggedInUser;

class MainMenu extends StatefulWidget {
  MainMenu({super.key});
  static String id = "MainMenu";

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  List<String> furnitureCategories = ['Action', 'Horror', 'Drama', 'Romance', 'Comedy', 'Science Fiction'];
  final _auth = FirebaseAuth.instance;
  @override
  MovieModel movieModel = MovieModel();
  List trendingMovies = [];
  List topRatedMovies = [];
  List popularShows = [];
  void initState(){
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    updateTrending();
    updateTopRatedMovies();
    updatePopularShows();
  }
  void updateTrending () async {
    trendingMovies = await movieModel.getTrendingMovies();
    print(trendingMovies);
  }
  void updateTopRatedMovies () async {
    topRatedMovies = await movieModel.getTopRatedMovies();
    print(topRatedMovies);
  }
  void updatePopularShows () async {
    popularShows = await movieModel.getPopularShows();
    print(popularShows);
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print('No user logged in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.black,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white70),
        ),
        leading: IconButton(
          color: Colors.white70,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              // go to the payment page
            },
            icon: const Icon(CupertinoIcons.cart),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black87,
                    )),
                    suffixIconColor: Colors.black87,
                    suffixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(style: BorderStyle.solid),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(style: BorderStyle.solid),
                    ),
                  ),
                  // onChanged: onChanged, // Use the provided onChanged function directly
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SelectionTab(categories: furnitureCategories,),
          Text('${MovieModel().getTrendingMovies()}'),
        ],
      ),
    );
  }
}

