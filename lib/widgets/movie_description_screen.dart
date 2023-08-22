import 'package:flutter/material.dart';
import 'package:furniture_app/backend/movie_model.dart';
import 'package:furniture_app/widgets/add_to_favirote_icon.dart';
import 'package:url_launcher/url_launcher.dart';
class MovieDescriptionScreen extends StatelessWidget {
  MovieDescriptionScreen(
      {super.key, required this.moviesList, required this.index});
  final List moviesList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 10,right: 10),
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'http://image.tmdb.org/t/p/w500' +
                      moviesList[index]['poster_path'],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: SingleChildScrollView(
              child: SizedBox(
                //alignment: Alignment.center,
                //padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height,
                child: Text(
                  moviesList[index]['overview'],
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(moviesList[index]['release_date'] != null
              ? 'Release Date : ${moviesList[index]['release_date']}'
              : ''),
          const SizedBox(
            height: 10,
          ),
          Text('Rate : ${moviesList[index]['vote_average']} ⭐'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AddToFavoriteIcon(movie: moviesList[index]),

              GestureDetector(
                onTap: ()async{
                  print(moviesList[index]);
                  _launchURL() async {
                    final String movieUrl = await MovieModel().WatchMovie(moviesList[index]['id']);
                    if (movieUrl != null && movieUrl.isNotEmpty) {
                      final Uri url = Uri.parse(movieUrl);
                      if (await canLaunch(url.toString())) {
                        await launch(url.toString());
                      } else {
                        print("Can't launch $url");
                      }
                    } else {
                      print("Invalid or empty movie URL");
                    }
                  }


                  _launchURL();
                  // print('Here here');
                  // print(moviesList[index]['id']);
                  // final movieDetailsUrl = await MovieModel().getMovieDetails(moviesList[index]['id']);
                  //
                  // if (movieDetailsUrl != null && movieDetailsUrl.isNotEmpty) {
                  //   try {
                  //     if (await canLaunch(movieDetailsUrl)) {
                  //       await launch(movieDetailsUrl);
                  //     } else {
                  //       print('Could not launch $movieDetailsUrl');
                  //     }
                  //   } catch (e) {
                  //     print('Error launching URL: $e');
                  //   }
                  // } else {
                  //   print('Invalid or empty movie details URL');
                  // }

                },
                child: const Row(
                  children: [
                    Text('Click to Watch now  '),
                    Icon(Icons.movie),

                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
