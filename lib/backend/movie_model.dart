import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tmdb_api/tmdb_api.dart';
String apiKey = 'a4b0001afd7e9ebcee3e5f7e4f39ce6c';
//String apiKey = '66aceb993bfe32a6b383fcc9909b910d';
//String readAccessToken =
    //'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NmFjZWI5OTNiZmUzMmE2YjM4M2ZjYzk5MDliOTEwZCIsInN1YiI6IjY0ZDc1NWEyMDAxYmJkMDEzYWVkYTAzYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2XTWaS9OHdUM2Lh9hCnJFBi5pveYiy6Q-9_cT6S6CgQ';
String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNGIwMDAxYWZkN2U5ZWJjZWUzZTVmN2U0ZjM5Y2U2YyIsInN1YiI6IjY0ZWY4MDJlZTBjYTdmMDEwZGUzNDkyMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FMwUUzS9xZIVB-TETBvtXnF7TJ6QESiIQkX8lqHLBcU';
TMDB tmdb = TMDB(ApiKeys(apiKey, readAccessToken));

class MovieModel {
  Future<List> getTrendingMovies() async {
    Map trendingResults = await tmdb.v3.trending.getTrending();
    //print ('The trending movies are \n\n\n\n\n');
    //print(trendingResults);
    return trendingResults['results'];
  }

  Future<List> getTopRatedMovies() async {
    Map topRatedResults = await tmdb.v3.movies.getTopRated();
    print ('The Top Rated movies are \n\n\n\n\n');
    print(topRatedResults['results']);

    return topRatedResults['results'];
  }

  Future<List> getPopularShows() async {
    Map popularShows = await tmdb.v3.tv.getPopular();
    //print ('The Popular shows are \n\n\n\n\n');
    //print(popularShows);
    return popularShows['results'];
  }

  Future<List> searchMovie(String movieName) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/search/movie?query=$movieName&api_key=$apiKey'));

      if (response.statusCode == 200) {
        List resultList = jsonDecode(response.body)['results'];

        for (int i = resultList.length - 1; i >= 0; i--) {
          if (resultList[i]['poster_path'] == null) {
            resultList.removeAt(i);
          }
        }

        //print(resultList);
        return resultList;
      } else {
        //print('Error fetching data');
        return [];
      }
    } catch (e) {
      //print('An error occurred: $e');
      return [];
    }
  }

  Future<String> watchMovie(int movieId) async {
    try {
      Map movieDetails = await tmdb.v3.movies.getDetails(movieId);
      return movieDetails['homepage'];
    } catch (e) {
      //print('An error occurred: $e');
      return '';
    }
  }
}
