import 'package:flutter/material.dart';
import 'package:furniture_app/backend/movie_model.dart';
import 'package:furniture_app/screens/search_result_screen.dart';
class MySearchBar extends StatefulWidget {
  const MySearchBar({
    super.key,
  });

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  late String searchValue;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 30),
        child: SizedBox(
          width: 300,
          child: TextField(
            style: const TextStyle(
              color: Colors.white
            ),
            cursorColor: Colors.red,
            onChanged: (value) {
              searchValue = value;
              //print(searchValue);
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  )),
              suffixIconColor: Colors.white,
              suffixIcon: GestureDetector(
                onTap: () async{
                  List resultList = await MovieModel().searchMovie(searchValue);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResultScreen(resultsList: resultList)));
                },
                child: const Icon(Icons.search),
              ),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(style: BorderStyle.solid),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(style: BorderStyle.solid),
              ),
            ),
            // onChanged: onChanged, // Use the provided onChanged function directly
          ),
        ),
      ),
    );
  }
}