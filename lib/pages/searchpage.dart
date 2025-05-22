import 'package:flutter/material.dart';
import 'package:task3/utilities/movie_modal.dart';
import 'package:task3/utilities/my_drawer.dart';
import 'package:provider/provider.dart';
import 'package:task3/utilities/mymovietile.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initial search
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //context.read<EXPLORE>().searchmovie("SULTAN");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
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
              hintStyle: TextStyle(
                color: Colors.grey.shade600,
                fontFamily: 'BebasNeue',
                fontSize: 32,
              ),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
              suffixIcon: controller.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        controller.clear();
                        context.read<EXPLORE>().searchmovie('');
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
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ),
      drawer: mydrawer(),
      body: SizedBox(
        height: 565,
        child: Consumer<EXPLORE>(
          builder: (context, explore, _) {
            if (explore.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (explore.searched.isEmpty) {
              return Center(
                child: Text(
                  "N O    R E S U L T S",
                  style: TextStyle(fontSize: 24),
                ),
              );
            } else {
              return ListView(
                children: [
                  Center(
                    child: Text(
                      "Search your favourite Movies",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 565,
                    child: ListView.builder(
                      itemCount: explore.searched.length,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 15),
                      itemBuilder: (context, index) {
                        final postertile = explore.searched[index];
                        return Mymovietile(POSTERDETAIL: postertile);
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
