import 'package:flutter/material.dart';
import 'package:task3/utilities/my_drawer.dart';

class Explorerpage extends StatefulWidget {
  const Explorerpage({super.key});

  @override
  State<Explorerpage> createState() => _ExplorerpageState();
}

class _ExplorerpageState extends State<Explorerpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "E X P L O R E ",
          style: TextStyle(),
        ),
      ),
      drawer: mydrawer(),
    );
  }
}
