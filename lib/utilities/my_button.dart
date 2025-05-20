import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const mybutton({required this.onTap, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12)),
        child: child,
      ),
    );
  }
}
