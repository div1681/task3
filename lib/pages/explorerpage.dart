import 'package:flutter/material.dart';

import 'package:task3/pages/searchpage.dart';
import 'package:task3/utilities/bigtile.dart';
import 'package:task3/utilities/movie_modal.dart';
import 'package:task3/utilities/my_botnavbar.dart';
import 'package:task3/utilities/my_drawer.dart';
import 'package:provider/provider.dart';
import 'package:task3/utilities/mymovietile.dart';

class Explorerpage extends StatefulWidget {
  const Explorerpage({super.key});

  @override
  State<Explorerpage> createState() => _ExplorerpageState();
}

class _ExplorerpageState extends State<Explorerpage> {
  @override
  Widget build(BuildContext context) {
    final recommended = context.watch<EXPLORE>().recom_movies;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "E X P L O R E ",
          style: TextStyle(fontFamily: 'BebasNeue', fontSize: 32),
        ),
      ),
      drawer: mydrawer(),
      body: ListView(
        children: [
          Center(
              child: Text(
            "Recommended Movies",
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          )),
          SizedBox(
            height: 565,
            child: ListView.builder(
                itemCount: recommended.length,
                scrollDirection: Axis.horizontal,
                padding:
                    EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 15),
                itemBuilder: (context, index) {
                  final postertile = recommended[index];

                  return Mymovietile(POSTERDETAIL: postertile);
                }),
          ),
        ],
      ),
    );
  }
}
