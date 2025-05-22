import 'package:flutter/material.dart';
import 'package:task3/utilities/fetch_movies.dart';
import 'bigtile.dart';

class SEARCH extends ChangeNotifier {
  List<postertile> searched_Movies = [];

  List<postertile> get searched => searched_Movies;

  Future<void> fetchSearch(String query) async {
    try {
      final List<dynamic> response = await Fetch_Movie.fetch("s", query);
      searched_Movies = response.map<postertile>((movie) {
        return postertile(
          title: movie['Title'] ?? "No Title",
          imageurl: movie['Poster'] ?? "",
          year: movie['Year'] ?? "N/A",
          imdb: movie['imdbID'] ?? "",
        );
      }).toList();
      notifyListeners();
    } catch (e) {
      searched_Movies = [];
      notifyListeners();
    }
  }

  void clear() {
    searched_Movies = [];
    notifyListeners();
  }
}
