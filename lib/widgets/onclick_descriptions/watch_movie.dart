import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../backend/movie_model.dart';
class WatchMovie extends StatelessWidget {
  const WatchMovie({
    super.key,
    required this.moviesList,
    required this.index,
  });

  final List moviesList;
  final int index;

  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      final String movieUrl = await MovieModel().watchMovie(moviesList[index]['id']);
      print("The movie url is $movieUrl");
      if (movieUrl != null && movieUrl.isNotEmpty) {
        final Uri url = Uri.parse(movieUrl);
        if (await canLaunch(url.toString())) {
          await launch(url.toString());
        } else {
          print("Can't launch $url");
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Media not available right now ... Try again later"),
            ),
          );
        }
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Media not available TV Shows coming soon"),
          ),
        );
      }
    }
    return GestureDetector(
      onTap: ()async{
        print(moviesList[index]);
        _launchURL();

      },
      child: const Row(
        children: [
          Text('Click to Watch now  '),
          Icon(Icons.movie),

        ],
      ),
    );
  }
}
