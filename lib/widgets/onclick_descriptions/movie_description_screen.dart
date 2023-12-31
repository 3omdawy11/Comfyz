import 'package:flutter/material.dart';
import 'package:furniture_app/widgets/onclick_descriptions/add_to_favorite_icon.dart';
import 'package:furniture_app/widgets/onclick_descriptions/watch_movie.dart';
class MovieDescriptionScreen extends StatelessWidget {
  const MovieDescriptionScreen(
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'http://image.tmdb.org/t/p/w500' +
                        moviesList[index]['poster_path'],
                  ),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              AddToFavoriteIcon(movie: moviesList[index]),

              WatchMovie(moviesList: moviesList, index: index),

            ],
          ),
        ],
      ),
    );
  }
}

