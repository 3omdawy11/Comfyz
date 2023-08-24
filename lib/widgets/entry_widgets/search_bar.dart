import 'package:flutter/material.dart';
import 'package:furniture_app/backend/movie_model.dart';
import 'package:furniture_app/screens/search_result_screen.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  late String searchValue;
  late TextEditingController _textEditingController = TextEditingController();
  late FocusNode _searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _searchFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Remove focus when tapping outside the search box
        _searchFocus.unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textEditingController,
                focusNode: _searchFocus,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    searchValue = value;
                  });
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Search for movies...',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () async {
                if (searchValue.isNotEmpty) {
                  List resultList = await MovieModel().searchMovie(searchValue);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchResultScreen(resultsList: resultList),
                    ),
                  );
                  _textEditingController.clear();
                  _searchFocus.unfocus(); // Remove focus after search
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.clear();
    _textEditingController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }
}
