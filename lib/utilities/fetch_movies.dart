import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task3/utilities/detailtile.dart';

class Fetch_Movie {
  static const String baseUrl = 'http://www.omdbapi.com/';
  static const String key = '70d06116';

  static Future<List<dynamic>> fetch(String q, String Q) async {
    final url = "$baseUrl?$q=$Q&apikey=$key";
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);

        if (q == 's' && json['Response'] == 'True') {
          final data = (json['Search'] as List)
              .where((movie) => movie['Poster'] != 'N/A')
              .toList();
          return data;
        } else {
          throw Exception(json['Error'] ?? 'No movies found');
        }
      }
    } catch (e) {
      throw Exception(e);
    }
    throw Exception("Something went wrong...");
  }

  static Future<Detailtile> fetchMovieDetail(String imdbID) async {
    final url = "$baseUrl?i=$imdbID&apikey=$key";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['Response'] == 'True') {
        return Detailtile(
          Title: json['Title'] ?? 'N/A',
          date: json['Released'] ?? 'N/A',
          Genre: json['Genre'] ?? 'N/A',
          Director: json['Director'] ?? 'N/A',
          Actors: json['Actors'] ?? 'N/A',
          Plot: json['Plot'] ?? 'N/A',
          poster: json['Poster'] ?? '',
          Rating: json['imdbRating'] ?? 'N/A',
        );
      } else {
        throw Exception(json['Error'] ?? 'Movie not found');
      }
    } else {
      throw Exception("Failed to load details");
    }
  }
}
