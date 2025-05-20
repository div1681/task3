import 'package:flutter/material.dart';
import 'package:task3/pages/explorerpage.dart';
import 'package:task3/pages/landingpage.dart';
import 'package:task3/pages/savedpage.dart';
import 'package:task3/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landingpage(),
      theme: lightmode,
      routes: {
        'landing': (context) => Landingpage(),
        'explorer': (context) => Explorerpage(),
        'saved': (context) => Savedpage()
      },
    );
  }
}
