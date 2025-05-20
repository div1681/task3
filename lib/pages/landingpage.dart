import 'package:flutter/material.dart';
import 'package:task3/utilities/my_button.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.movie_creation_outlined,
              size: 120,
              color: Colors.grey.shade700,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "M O V I E   Z O N E",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            mybutton(
                onTap: () {
                  Navigator.pushNamed(context, 'explorer');
                },
                child: Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
