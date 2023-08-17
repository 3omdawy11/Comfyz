import 'package:flutter/cupertino.dart';

class PersonalData extends ChangeNotifier{
  List<List>myFavorites = [];
  void addMovie(List list){
    myFavorites.add(list);
    notifyListeners();
  }
  void deleteMovie(List list){
    myFavorites.remove(list);
    notifyListeners();
  }


}