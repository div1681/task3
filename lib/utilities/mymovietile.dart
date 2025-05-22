import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:task3/pages/detailpage.dart';
import 'package:task3/utilities/bigtile.dart';
import 'package:task3/utilities/movie_modal.dart';
import 'package:provider/provider.dart';

class Mymovietile extends StatelessWidget {
  final postertile POSTERDETAIL;
  const Mymovietile({required this.POSTERDETAIL, super.key});

  void addtoSaved(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Add to Watchlist?"),
              ),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<EXPLORE>().addtoSave(POSTERDETAIL);
                  },
                  child: Text("Yes"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailpage(imdb: POSTERDETAIL.imdb),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      scale: 1.1,
                      POSTERDETAIL.imageurl,
                      errorBuilder: (context, error, StackTrace) {
                        return SizedBox(
                            height: 390,
                            width: 258,
                            child: Center(
                                child: Text("N O   I M A G E",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.grey.shade700,
                                    ))));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 30,
                    width: 218,
                    child: POSTERDETAIL.title.length > 21
                        ? Marquee(
                            text: POSTERDETAIL.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            scrollAxis: Axis.horizontal,
                            blankSpace: 100,
                            velocity: 30.0,
                            pauseAfterRound: Duration(seconds: 1),
                            startPadding: 10,
                            accelerationDuration: Duration(seconds: 1),
                            accelerationCurve: Curves.linear,
                            decelerationDuration: Duration(milliseconds: 500),
                            decelerationCurve: Curves.easeOut,
                          )
                        : Text(
                            POSTERDETAIL.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    POSTERDETAIL.year,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Icons.bookmark_outline_sharp),
                        onPressed: () => addtoSaved(context))),
              ))
        ]),
      ),
    );
  }
}
