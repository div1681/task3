import 'package:flutter/material.dart';
import 'package:task3/utilities/movie_modal.dart';
import 'package:task3/utilities/my_drawer.dart';
import 'package:animated_search/animated_search.dart';
import 'package:provider/provider.dart';
import 'package:task3/utilities/mymovietile.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final TextEditingController controller = TextEditingController();
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EXPLORE>().searchmovie("SULTAN");
    });

    //context.read<EXPLORE>().searchmovie("SULTAN");
  }

  @override
  Widget build(BuildContext context) {
    final results = context.watch<EXPLORE>().searched;

    return Scaffold(
        backgroundColor: Colors.grey.shade300,

        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     "S E A R C H  ",
        //     style: TextStyle(),
        //   ),
        // ),

        appBar: AppBar(
          //backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          centerTitle: true,
          //iconTheme: IconThemeData(color: Colors.grey.shade700),
          title: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  context.read<EXPLORE>().searchmovie(value.trim());
                }
              },
              decoration: InputDecoration(
                hintText: "S E A R C H",
                hintStyle: TextStyle(color: Colors.grey.shade500),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                suffixIcon: controller.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          controller.clear();
                          Provider.of<EXPLORE>(context, listen: false)
                              .searchmovie('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
          ),
        ),
        drawer: mydrawer(),
        body: SizedBox(
          height: 565,
          child: ListView(
            children: [
              Center(
                  child: Text(
                "Search your favourite movies",
                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              )),
              SizedBox(
                height: 565,
                child: ListView.builder(
                    itemCount: results.length,
                    scrollDirection: Axis.horizontal,
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 15),
                    itemBuilder: (context, index) {
                      final postertile = results[index];

                      return Mymovietile(POSTERDETAIL: postertile);
                    }),
              ),
            ],
          ),
        ));
  }
}
