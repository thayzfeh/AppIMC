import 'package:another_flushbar/flushbar.dart';
import 'package:app_imc/controller/login_controller.dart';
import 'package:app_imc/model/user.dart';
import 'package:app_imc/view/components/app_title.dart';
import 'package:app_imc/view/components/ok_button.dart';
import 'package:app_imc/view/components/login_row.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  void _tryLogin() {
    User user =
        User(user: form_values['User'][1], pass: form_values['Pass'][1]);
    if (LoginController.isValid(user)) {
      Flushbar(
        title: 'Sucesso!',
        message:
            'Encontramos sua conta! Aguarde enquanto preparamos sua tela inicial!',
        duration: Duration(seconds: 3),
        showProgressIndicator: true,
      ).show(context);
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacementNamed('/home');
      });
    } else {
      Flushbar(
        title: 'Erro de autenticação :(',
        message:
            'Usuário não encontrado, verifique os dados e tente novamente.',
        duration: Duration(seconds: 5),
      ).show(context);
    }
  }

  void _trySign() {
    User user =
        User(user: form_values['User'][1], pass: form_values['Pass'][1]);
    if (LoginController.trySign(user)) {
      Flushbar(
        title: 'Sucesso!',
        message:
            'Sua conta foi criada! Aguarde enquanto preparamos sua tela inicial!',
        duration: Duration(seconds: 3),
        showProgressIndicator: true,
      ).show(context);
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacementNamed('/home');
      });
    } else {
      Flushbar(
        title: 'Erro :(',
        message:
            'Já existe um usuário cadastrado com esse nome, escolha outro!',
        duration: Duration(seconds: 5),
      ).show(context);
    }
  }

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
        height: MediaQuery.of(context).size.height / 2.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTitle(
                data: 'IMC APP',
                color: Colors.white,
              ),
              LoginRow(
                  isPass: false,
                  label: "Login",
                  callback: _callbackUser,
                  atualizarBotao: _verifyInputs),
              LoginRow(
                  isPass: true,
                  label: "Senha",
                  callback: _callbackPass,
                  atualizarBotao: _verifyInputs),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OkButton(
                      onClick: _tryLogin,
                      getActiveButton: () => _button,
                      data: 'Entrar'),
                  OkButton(
                      onClick: _trySign,
                      getActiveButton: () => _button,
                      data: 'Cadastrar')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
