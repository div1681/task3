import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  const MyDrawerTile(
      {required this.icon, required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontFamily: 'BebasNeue',
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
