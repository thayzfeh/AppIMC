import 'package:app_imc/services/prefs_service.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<String> futureCall() async {
    bool isAuth = await PrefsService.isAuth();
    await Future.delayed(const Duration(seconds: 5));
    if (isAuth) {
      return Future.value('/home');
    }
    return Future.value('/login');
  }

    @override
    Widget build(BuildContext context) {
      return EasySplashScreen(
        logo: Image.asset('assets/images/logo.png'),
        title: Text('App IMC'),
        showLoader: true,
        loadingText: Text('Carregando...'),
        futureNavigator: futureCall(),
      );
    }
  }

