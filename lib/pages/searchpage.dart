import 'package:flutter/material.dart';
import 'package:task3/utilities/my_drawer.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "S E A R C H  ",
          style: TextStyle(),
        ),
      ),
      drawer: mydrawer(),
    );
  }
}
