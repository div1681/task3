import 'dart:convert';

import 'package:http/http.dart' as http;

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
        if (json['Response'] == 'True') {
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
}
