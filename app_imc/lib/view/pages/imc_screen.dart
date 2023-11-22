import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ImcScreen extends StatefulWidget {
  const ImcScreen({super.key});

  @override
  State<ImcScreen> createState() => _ImcScreen();
}

class _ImcScreen extends State<ImcScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child:
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Calculadora de IMC",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 144, 224, 70),
                decoration: TextDecoration.none,
                fontSize: 35,
          ),
          maxLines: 1,),
            ]),
    );
  }
}
