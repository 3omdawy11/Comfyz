import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../backend/movie_model.dart';
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
            Column(
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
                                color: Colors.white,
                              )),
                          suffixIconColor: Colors.white,
                          suffixIcon: const Icon(Icons.search),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.white
                          ),
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
                Text('${MovieModel().getTrendingMovies()}'),
              ],
            ),
            MovieList(listName: 'Trending',moviesList: trendingMovies,),
            MovieList(listName: 'Top Rated', moviesList: topRatedMovies),
            MovieList(listName: 'Popular shows', moviesList: popularShows)
          ],
        ),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  MovieList({required this.listName, required this.moviesList});
  final String listName;
  final List moviesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              listName,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          SizedBox(
            height: 200, // Adjust this height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: moviesList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(context: (context), builder: (BuildContext context) {
                      return Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'http://image.tmdb.org/t/p/w500' +
                                      moviesList[index]['poster_path'],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(moviesList[index]['overview']),
                          )
                        ],
                      );
                    });
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'http://image.tmdb.org/t/p/w500' +
                                    moviesList[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
