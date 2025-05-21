import 'package:flutter/material.dart';

import 'bigtile.dart';

class EXPLORE extends ChangeNotifier {
  final List<postertile> recom_movies = [
    postertile(
        title: "Chernobyl",
        imageurl:
            "https://m.media-amazon.com/images/M/MV5BNzU0OTI4YTQtNGQ1ZS00ZjA4LTg3MTMtZjkyZWNjN2RiZDJmXkEyXkFqcGc@._V1_SX300.jpg",
        year: "2019",
        imdb: "tt7366338"),
    postertile(
        title: "Life of Pi",
        year: "2012",
        imdb: "tt0454876",
        imageurl:
            "https://m.media-amazon.com/images/M/MV5BNTg2OTY2ODg5OF5BMl5BanBnXkFtZTcwODM5MTYxOA@@._V1_SX300.jpg"),
    postertile(
        title: "Manjummel Boys",
        year: "2024",
        imdb: "tt26458038",
        imageurl:
            "https://m.media-amazon.com/images/M/MV5BMDVkOGEzZDgtYWU4Yi00MDA3LWE4YmQtYjQxNDgwNDYxNGU4XkEyXkFqcGc@._V1_SX300.jpg"),
    postertile(
        title: "The Prestige",
        year: "2006",
        imdb: "tt0482571",
        imageurl:
            "https://m.media-amazon.com/images/M/MV5BMjA4NDI0MTIxNF5BMl5BanBnXkFtZTYwNTM0MzY2._V1_SX300.jpg"),
    postertile(
        title: "How to Train Your Dragon 2",
        year: "2014",
        imdb: "tt1646971",
        imageurl:
            "https://m.media-amazon.com/images/M/MV5BMzMwMTAwODczN15BMl5BanBnXkFtZTgwMDk2NDA4MTE@._V1_SX300.jpg"),
    postertile(
        title: "Inside Out 2",
        year: "2024",
        imdb: "tt22022452",
        imageurl:
            "https://m.media-amazon.com/images/M/MV5BYWY3MDE2Y2UtOTE3Zi00MGUzLTg2MTItZjE1ZWVkMGVlODRmXkEyXkFqcGc@._V1_SX300.jpg"),
    postertile(
        title: "Train to Busan",
        year: "2016",
        imdb: "tt5700672",
        imageurl:
            "https://m.media-amazon.com/images/M/MV5BMTkwOTQ4OTg0OV5BMl5BanBnXkFtZTgwMzQyOTM0OTE@._V1_SX300.jpg"),
    postertile(
        title: "Knives Out",
        year: "2019",
        imdb: "tt8946378",
        imageurl:
            "https://m.media-amazon.com/images/M/MV5BZDU5ZTRkYmItZjg0Mi00ZTQwLThjMWItNWM3MTMxMzVjZmVjXkEyXkFqcGc@._V1_SX300.jpg"),
    postertile(
        title: "The Godfather",
        year: "1972",
        imdb: "tt0068646",
        imageurl:
            "https://m.media-amazon.com/images/M/MV5BNGEwYjgwOGQtYjg5ZS00Njc1LTk2ZGEtM2QwZWQ2NjdhZTE5XkEyXkFqcGc@._V1_SX300.jpg"),
    postertile(
        title: "The Dark Knight",
        year: "2008",
        imdb: "tt0468569",
        imageurl:
            "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg"),
  ];

  List<postertile> _saved = [];

  List<postertile> get recom => recom_movies;

  List<postertile> get saved => _saved;

  void addtoSave(postertile item) {
    _saved.add(item);
    notifyListeners();
  }

  void removeSaved(postertile item) {
    _saved.remove(item);
    notifyListeners();
  }
}
