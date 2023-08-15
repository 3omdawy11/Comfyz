import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../backend/movie_model.dart';
import 'package:furniture_app/widgets/movie_list.dart';
import 'package:furniture_app/widgets/search_bar.dart';
import 'package:furniture_app/widgets/movie_description_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    print(trendingMovies);
  }

  void updateTopRatedMovies() async {
    topRatedMovies = await movieModel.getTopRatedMovies();
    setState(() {});
    print(topRatedMovies);
  }

  void updatePopularShows() async {
    popularShows = await movieModel.getPopularShows();
    setState(() {});
    print(popularShows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SideMenuIcons(),
        title: const Text(
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

class DrawerOptions extends StatelessWidget {
  DrawerOptions(
      {super.key,
      required this.iconName,
      required this.icon,
      required this.onTap});
  late String iconName;
  late Icon icon;
  late VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        iconName,
        style: TextStyle(color: Colors.black87),
      ),
      leading: icon,
      onTap: onTap,
    );
  }
}

class SideMenuIcons extends StatelessWidget {
  const SideMenuIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      onPressed: () {
        // Open the drawer
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
