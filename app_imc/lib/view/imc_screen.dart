import 'package:flutter/material.dart';

class ImcScreen extends StatefulWidget {
  const ImcScreen({super.key});

  @override
  State<ImcScreen> createState() => _ImcScreen();
}

class _ImcScreen extends State<ImcScreen> {
  List<dynamic> elementsList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: elementsList;
      ),
    );
  }
}
