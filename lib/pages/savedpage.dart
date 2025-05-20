import 'package:flutter/material.dart';
import 'package:task3/utilities/my_drawer.dart';

class Savedpage extends StatefulWidget {
  const Savedpage({super.key});

  @override
  State<Savedpage> createState() => _SavedpageState();
}

class _SavedpageState extends State<Savedpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "S A V E D   M O V I E S",
          style: TextStyle(),
        ),
      ),
      drawer: mydrawer(),
    );
  }
}
