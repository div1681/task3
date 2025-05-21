import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class my_botnavbar extends StatelessWidget {
  void Function(int)? onTabChange;
  my_botnavbar({required this.onTabChange, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      //margin: EdgeInsets.symmetric(vertical: 10),
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: [
          GButton(
            icon: Icons.home,
            text: "EXPLORE",
          ),
          GButton(
            icon: Icons.search_rounded,
            text: "SEARCH",
          )
        ],
      ),
    );
  }
}
