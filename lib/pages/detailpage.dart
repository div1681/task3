import 'package:flutter/material.dart';
import 'package:task3/utilities/detailtile.dart';
import 'package:task3/utilities/fetch_movies.dart';

class Detailpage extends StatefulWidget {
  final String imdb;
  const Detailpage({required this.imdb, super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

Widget _infoText(String label, String value,
    {TextStyle? labelStyle, TextStyle? valueStyle}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$label: ",
            style: labelStyle ??
                const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
          ),
          TextSpan(
            text: value,
            style: valueStyle ??
                TextStyle(fontSize: 16, color: Colors.grey.shade800),
          ),
        ],
      ),
    ),
  );
}

class _DetailpageState extends State<Detailpage> {
  late Future<Detailtile> detail;

  @override
  void initState() {
    // TODO: implement initState
    detail = getdetail();
    super.initState();
  }

  Future<Detailtile> getdetail() async {
    final result = await Fetch_Movie.fetchMovieDetail(widget.imdb);
    return result as Detailtile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Detailtile>(
        future: detail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final movie = snapshot.data!;

            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              movie.Title,
                              style: const TextStyle(
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(width: 50),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            movie.poster,
                            height: 224,
                            //fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Plot big on right, fills remaining width
                        Expanded(
                          child: Text(
                            movie.Plot,
                            style: const TextStyle(fontSize: 14, height: 1.4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _infoText("Released", movie.date),
                    _infoText("Actors", movie.Actors),
                    _infoText("Director", movie.Director),
                    _infoText("Genre", movie.Genre),
                    const SizedBox(height: 56),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "IMDb Rating : ",
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: "${movie.Rating} / 10",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text("N O   D A T A"));
          }
        },
      ),
    );
  }
}
