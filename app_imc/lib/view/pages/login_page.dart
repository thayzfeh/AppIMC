import 'package:flutter/material.dart';

import 'package:app_imc/view/components/login_card.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 26, 14, 1),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [LoginCard(),]
        ),
      ),
    );
  }
}
