import 'package:flutter/material.dart';
import 'package:task3/pages/explorerpage.dart';
import 'package:task3/pages/searchpage.dart';
import 'package:task3/utilities/my_botnavbar.dart';

class botnavpage extends StatefulWidget {
  const botnavpage({super.key});

  @override
  State<botnavpage> createState() => _botnavpageState();
}

class _botnavpageState extends State<botnavpage> {
  int _selected = 0;
  void navigatebottombar(int index) {
    setState(() {
      _selected = index;
    });
  }

  final List<Widget> _pages = [
    Explorerpage(),
    Searchpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: my_botnavbar(
        onTabChange: (index) => navigatebottombar(index),
      ),
      body: _pages[_selected],
    );
  }
}
