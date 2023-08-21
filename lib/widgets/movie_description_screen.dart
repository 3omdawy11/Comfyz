
import 'package:flutter/material.dart';
import 'package:furniture_app/widgets/add_to_favirote_icon.dart';
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
          AddToFavoriteIcon(movie: moviesList[index])

        ],
      ),
    );
  }
}
