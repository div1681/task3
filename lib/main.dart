import 'package:flutter/material.dart';
import 'package:task3/pages/explorerpage.dart';
import 'package:task3/pages/landingpage.dart';
import 'package:task3/pages/navbarpage.dart';
import 'package:task3/pages/savedpage.dart';
import 'package:task3/themes/light_mode.dart';
import 'package:provider/provider.dart';
import 'package:task3/utilities/movie_modal.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => EXPLORE(),
    child: const MyApp(),
  ));
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
        'saved': (context) => Savedpage(),
        'navigator': (context) => botnavpage(),
      },
    );
  }
}
