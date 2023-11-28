import 'package:app_imc/main.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget{
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Calculadora de IMC',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: MyApp.getDefaultColor(),
            decoration: TextDecoration.none,
            fontSize: 35,
          ),
          maxLines: 1,
    );
  }

}