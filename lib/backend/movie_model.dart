import 'networking.dart';
import 'package:tmdb_api/tmdb_api.dart';
String apiKey = '66aceb993bfe32a6b383fcc9909b910d';
String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NmFjZWI5OTNiZmUzMmE2YjM4M2ZjYzk5MDliOTEwZCIsInN1YiI6IjY0ZDc1NWEyMDAxYmJkMDEzYWVkYTAzYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2XTWaS9OHdUM2Lh9hCnJFBi5pveYiy6Q-9_cT6S6CgQ';

TMDB tmdb = TMDB (ApiKeys(apiKey,readAccessToken));

class MovieModel {
  // Future<dynamic> getMovies (String movieName) async{
  //   Networking networking = Networking(uri: 'https://api.tvmaze.com/schedule?country=US&date=2023-08-10');
  //   var movieData = await networking.getData();
  //   final List<String> movieNames = [];
  //   for (var movie in movieData){
  //     if (movie['name'] != null){
  //       movieNames.add(movie['name']);
  //       print(movie['name']);
  //     }
  //   }
  //   return movieData;
  // }
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
}
