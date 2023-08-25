import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:provider/provider.dart';

import '../../backend/personal_data.dart';
import '../onclick_descriptions/movie_description_screen.dart';
class OutcomeList extends StatelessWidget {
  OutcomeList({
    super.key, required this.movieList
  });
  List movieList;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: movieList.isNotEmpty
          ? Center(
        child: SizedBox(
          height: 6000,
          child: ListView.builder(
            padding: const EdgeInsets.all(15),
            scrollDirection: Axis.vertical,
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return MovieDescriptionScreen(
                        moviesList: movieList,
                        index: index,
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 140,
                      child: Container(
                        height: kMoviePicHeight,
                        decoration: BoxDecoration(
                          image: movieList[index]
                          ['poster_path'] !=
                              null
                              ? DecorationImage(
                            image: NetworkImage(
                              'http://image.tmdb.org/t/p/w500' +
                                  movieList[index]
                                  ['poster_path'],
                            ),
                          )
                              : null, // No image path, set to null
                        ),
                        child: movieList[index]
                        ['poster_path'] ==
                            null
                            ? const Center(
                          child: Text('No Image'),
                        )
                            : null, // Displayed only when there's no image path
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: SizedBox(
                        width: 200,
                        child: (movieList[index]['original_title'] != null) ? Text(movieList[index]
                        ['original_title'],
                          style:
                          const TextStyle(color: Colors.white),) : Text(movieList[index]
                        ['original_name'],
                          style:
                          const TextStyle(color: Colors.white),)
                      ),
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      )
          : const Center(
        child: Text(
          'No results found',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
