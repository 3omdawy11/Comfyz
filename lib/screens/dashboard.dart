import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../backend/movie_model.dart';
import 'package:furniture_app/widgets/movie_list.dart';
import 'package:furniture_app/widgets/search_bar.dart';
late User loggedInUser;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static String id = 'Dashboard';
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _auth = FirebaseAuth.instance;
  MovieModel movieModel = MovieModel();
  List trendingMovies = [];
  List topRatedMovies = [];
  List popularShows = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    updateTrending();
    updateTopRatedMovies();
    updatePopularShows();
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

  void updateTrending() async {
    trendingMovies = await movieModel.getTrendingMovies();
    print(trendingMovies);
  }

  void updateTopRatedMovies() async {
    topRatedMovies = await movieModel.getTopRatedMovies();
    print(topRatedMovies);
  }

  void updatePopularShows() async {
    popularShows = await movieModel.getPopularShows();
    print(popularShows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comfyz',
        ),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MySearchBar(),
            const SizedBox(
              height: 20,
            ),
            MovieList(listName: 'Trending', moviesList: trendingMovies),
            MovieList(listName: 'Top Rated', moviesList: topRatedMovies),
            MovieList(listName: 'Popular shows', moviesList: popularShows)
          ],
        ),
      ),
    );
  }
}

