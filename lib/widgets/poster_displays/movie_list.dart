import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import '../onclick_descriptions/movie_description_screen.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    Key? key,
    required this.listName,
    required this.moviesList,
    required this.horizontal,
  }) : super(key: key);

  final String listName;
  final List moviesList;
  final bool horizontal;

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
              style: kListHeadersStyle,
            ),
          ),
          SizedBox(
            height: kMoviePicHeight, // Adjust this height as needed
            child: moviesList.isEmpty // Check if the data is empty
                ? const Center(
              child:
              CircularProgressIndicator(), // Show a loading indicator
            )
                : ListView.builder(
              scrollDirection:
              horizontal ? Axis.horizontal : Axis.vertical,
              itemCount: moviesList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    print(moviesList[index]['poster_path']);
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: (context),
                        builder: (BuildContext context) {
                          return MovieDescriptionScreen(
                            moviesList: moviesList,
                            index: index,
                          );
                        });
                  },
                  child: SizedBox(
                    width: 140,
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: moviesList[index]['poster_path'] != null
                            ? DecorationImage(
                          image: NetworkImage(
                            'http://image.tmdb.org/t/p/w500'+
                                moviesList[index]['poster_path'],
                          ),
                          fit: BoxFit.cover,
                        )
                            : null, // No image path, set to null
                      ),
                      child: moviesList[index]['poster_path'] == null
                          ? const Center(
                        child: Text('No Image',style: TextStyle(color: Colors.white),),
                      )
                          : null, // Displayed only when there's no image path
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
