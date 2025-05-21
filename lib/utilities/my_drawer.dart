import 'package:flutter/material.dart';
import 'package:task3/utilities/my_drawer_tile.dart';

class mydrawer extends StatelessWidget {
  const mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.grey.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                    child: Icon(
                  Icons.local_movies_rounded,
                  size: 72,
                  color: Colors.grey.shade700,
                )),
                SizedBox(
                  height: 25,
                ),
                MyDrawerTile(
                    icon: Icons.movie_creation_outlined,
                    text: "EXLPORE",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, 'navigator');
                    }),
                MyDrawerTile(
                    icon: Icons.save_alt_rounded,
                    text: "WATCHLIST",
                    onTap: () {
                      Navigator.pushNamed(context, 'saved');
                    }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: MyDrawerTile(
                  icon: Icons.logout,
                  text: "EXIT",
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'landing', (route) => false);
                  }),
            ),
          ],
        ));
  }
}
