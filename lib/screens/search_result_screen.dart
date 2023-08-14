import 'package:flutter/material.dart';
import 'package:furniture_app/widgets/movie_list.dart';

import '../widgets/movie_description_screen.dart';
class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({super.key, required this.resultsList});
  static String id = "SearchResultScreen";
  late List resultsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SizedBox(
        height: 6000,
        child: SafeArea(
          child: resultsList.isNotEmpty ? ListView.builder(
            padding: EdgeInsets.all(15),
            scrollDirection: Axis.vertical,
            itemCount: resultsList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: (context),
                      builder: (BuildContext context) {
                        return MovieDescriptionScreen(
                          moviesList: resultsList,
                          index: index,
                        );
                      });
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 140,
                      child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:NetworkImage(
                                  'http://image.tmdb.org/t/p/w500' +
                                      resultsList[index]['poster_path'],
                                ),
                              ),
                            ),
                          ),


                      ),
                  ],
                ),
              );
            },
          ) : const Center(child: Text('No results found',
          style: TextStyle(
            color: Colors.white
          ),)),
        ),
      )
    );
  }
}
