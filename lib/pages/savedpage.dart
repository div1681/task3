import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task3/utilities/movie_modal.dart';
import 'package:task3/utilities/my_drawer.dart';
import 'package:task3/utilities/mymovietile.dart';
import 'package:task3/utilities/mymovietile_saved.dart';

class Savedpage extends StatefulWidget {
  const Savedpage({super.key});

  @override
  State<Savedpage> createState() => _SavedpageState();
}

class _SavedpageState extends State<Savedpage> {
  @override
  Widget build(BuildContext context) {
    final watchlist = context.watch<EXPLORE>().saved;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "W A T C H L I S T",
          style: TextStyle(fontFamily: 'BebasNeue', fontSize: 32),
        ),
      ),
      drawer: mydrawer(),
      body: ListView(
        children: watchlist.isEmpty
            ? [
                Center(
                    child: Text(
                  "Add Movies to Watchlist...",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                )),
              ]
            : [
                Center(
                    child: Text(
                  "Checkout your Saved Movies",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                )),
                SizedBox(
                  height: 565,
                  child: ListView.builder(
                      itemCount: watchlist.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(
                          left: 5, right: 5, top: 15, bottom: 15),
                      itemBuilder: (context, index) {
                        final postertile = watchlist[index];

                        return Mysavedmovietile(POSTERDETAIL: postertile);
                      }),
                ),
              ],
      ),
    );
  }
}
