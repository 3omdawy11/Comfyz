import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/favorites_screen.dart';
import 'package:furniture_app/widgets/side_menu/drawer_option.dart';
import '../backend/movie_model.dart';
import 'package:furniture_app/widgets/poster_displays/movie_list.dart';
import 'package:furniture_app/widgets/entry_widgets/search_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_app/widgets/side_menu/side_menu_icon.dart';

late User loggedInUser;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static String id = 'Dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with WidgetsBindingObserver {
  final _auth = FirebaseAuth.instance;
  MovieModel movieModel = MovieModel();
  List trendingMovies = [];
  List topRatedMovies = [];
  List popularShows = [];

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    updateTrending();
    updateTopRatedMovies();
    updatePopularShows();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      updateTrending();
      updateTopRatedMovies();
      updatePopularShows();
    }
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
    setState(() {});
    //print(trendingMovies);
  }

  void updateTopRatedMovies() async {
    topRatedMovies = await movieModel.getTopRatedMovies();
    setState(() {});
    //print(topRatedMovies);
  }

  void updatePopularShows() async {
    popularShows = await movieModel.getPopularShows();
    setState(() {});
    //print(popularShows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SideMenuIcon(),
        title: const Text(
          'Comfyz', style: kAppBarTitleStyle,
        ),
        backgroundColor: Colors.red,
      ),
      backgroundColor: kBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MySearchBar(),
            const SizedBox(
              height: 20,
            ),
            MovieList(
              listName: 'Trending',
              moviesList: trendingMovies,
              horizontal: true,
            ),
            MovieList(
              listName: 'Top Rated',
              moviesList: topRatedMovies,
              horizontal: true,
            ),
            MovieList(
              listName: 'Popular shows',
              moviesList: popularShows,
              horizontal: true,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.5,
        backgroundColor: Colors.redAccent,
        child: ListView(
          children: [
            DrawerOptions(
              iconName: 'Favorites',
              icon: const Icon(
                CupertinoIcons.star,
              ),
              onTap: () {
                Navigator.pushNamed(context, FavoriteScreen.id);
              },
            ),
            DrawerOptions(
              iconName: 'Settings',
              icon: const Icon(Icons.settings),
              onTap: () {},
            ),
            DrawerOptions(
                iconName: 'Sign out',
                icon: const Icon(Icons.login_outlined),
                onTap: () {
                  _auth.signOut();
                  Navigator.pop(context);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}



