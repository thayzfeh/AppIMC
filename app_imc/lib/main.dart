import 'package:app_imc/view/imc_screen/imc_screen.dart';
import 'package:app_imc/view/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  static final Color _defaultColor = Color.fromARGB(255, 144, 224, 70);
  static Color getDefaultColor() {
    return _defaultColor;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
