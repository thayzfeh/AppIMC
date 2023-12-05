
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String data;
  final Color color;
  const AppTitle({super.key, required this.data, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        decoration: TextDecoration.none,
        fontSize: 35,
      ),
      maxLines: 1,
    );
  }
}
