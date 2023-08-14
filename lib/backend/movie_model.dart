import 'dart:convert';

import 'networking.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_api/tmdb_api.dart';
String apiKey = '66aceb993bfe32a6b383fcc9909b910d';
String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NmFjZWI5OTNiZmUzMmE2YjM4M2ZjYzk5MDliOTEwZCIsInN1YiI6IjY0ZDc1NWEyMDAxYmJkMDEzYWVkYTAzYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2XTWaS9OHdUM2Lh9hCnJFBi5pveYiy6Q-9_cT6S6CgQ';

TMDB tmdb = TMDB (ApiKeys(apiKey,readAccessToken));

class MovieModel {

  Future<List> getTrendingMovies() async {
    Map trendingResults = await tmdb.v3.trending.getTrending();
    print ('The trending movies are \n\n\n\n\n');
    //print(trendingResults);
    return trendingResults['results'];
  }
  Future<List> getTopRatedMovies() async {
    Map topRatedResults = await tmdb.v3.movies.getTopRated();
    print ('The Top Rated movies are \n\n\n\n\n');
    //print(topRatedResults);
    return topRatedResults['results'];
  }
  Future<List> getPopularShows() async {
    Map popularShows = await tmdb.v3.tv.getPopular();
    print ('The Popular shows are \n\n\n\n\n');
    //print(popularShows);
    return popularShows['results'];
  }
  Future<dynamic>searchMovie(String movieName)async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/search/movie?query=$movieName&api_key=$apiKey'));
    if (response.statusCode == 200){
      print(jsonDecode(response.body)['results']);
    }else{
      print ('Error boy'); // most likely wont happen because if returns empty list if there are no results
    }
    return jsonDecode(response.body)['results'];
  }
}
