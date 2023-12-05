import 'package:app_imc/view/imc_screen/components/app_title.dart';
import 'package:app_imc/view/imc_screen/components/ok_button.dart';
import 'package:app_imc/view/login/components/login_row.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  void _verifyInputs() {
    setState(() {
      if (form_values['User']?[0] && form_values['Pass']?[0]) {
        _button = true;
      } else {
        _button = false;
      }
    });
  }

  void _callbackUser(bool value, dynamic user) {
    form_values['User'] = [value, user];
  }

  void _callbackPass(bool value, dynamic pass) {
    form_values['Pass'] = [value, pass];
  }

  final Color _backgroundColor = Color.fromARGB(255, 26, 14, 1);
  Map form_values = {
    'User': [false],
    'Pass': [false]
  };
  bool _button = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: _backgroundColor,
      child: SizedBox(
        height: MediaQuery.of(context).size.height /2.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTitle(data: 'Meu Aplicativo', color: Colors.white,),
              LoginRow(
                  isPass: false,
                  label: "Login",
                  callback: _callbackUser,
                  atualizarBotao: _verifyInputs),
              LoginRow( isPass:true, label: "Senha", callback: _callbackPass, atualizarBotao: _verifyInputs),
              OkButton(onClick: () => null, getActiveButton: () => _button, data: 'Entrar')
            ],
          ),
        ),
      ),
    );
  }
}
