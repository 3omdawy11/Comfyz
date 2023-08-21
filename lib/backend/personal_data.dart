import 'package:flutter/foundation.dart'; // Import ChangeNotifier

class PersonalData extends ChangeNotifier {
  List<dynamic> myFavorites = [];

  void addMovie(dynamic movie) {
    myFavorites.add(movie);
    notifyListeners();
  }

  void deleteMovie(dynamic movie) {
    myFavorites.remove(movie);
    notifyListeners();
  }

  bool findMovie(dynamic movie) {
    return myFavorites.contains(movie);
  }
}
