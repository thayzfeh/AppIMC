import 'package:app_imc/main.dart';
import 'package:app_imc/services/prefs_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Início'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Icon(Icons.account_circle, size: 100),
                  ElevatedButton(
                      onPressed: () {
                        PrefsService.logout();
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                      child: Text('Sair da conta'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(MyApp.getDefaultColor())
                      ),)
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Calcular IMC'),
              onTap: () {
                Navigator.of(context).pushNamed('/imc');
              },
            )
          ],
        ),
      ),
    );
  }
}
