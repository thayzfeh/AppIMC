import 'package:flutter/material.dart';
import 'package:app_imc/main.dart';

import 'form_row.dart';
import 'ok_button.dart';

class FormCard extends StatefulWidget {
  final void Function({required bool sex, required int age, required double weight, required double height}) calcImc;
  const FormCard({super.key, required this.calcImc});

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  void _verificarInputVazio() {
    setState(() {
      if (valoresCampo['altura']?[0] &&
          valoresCampo['idade']?[0] &&
          valoresCampo['peso']?[0]) {
        _botaoAtivo = true;
      } else {
        _botaoAtivo = false;
      }
    });
  }

  void _callbackPeso(bool boolValor, dynamic valor) {
    valoresCampo['peso'] = [boolValor, valor];
  }

  void _callbackIdade(bool boolValor, dynamic valor) {
    valoresCampo['idade'] = [boolValor, valor];
  }

  void _callbackAltura(bool boolValor, dynamic valor) {
    valoresCampo['altura'] = [boolValor, valor];
  }

  bool _botaoAtivo = false;
  bool _sexoBool = false;
  String sexo = "Masculino";
  Map valoresCampo = {
    'altura': [false],
    'idade': [false],
    'peso': [false],
  };
  Map data = {
    'imc': "",
    'descricao': "",
    'pesoMin': "",
    'pesoMax': "",
    'cor': Colors.black
  };
  void _calcularDados() {
    widget.calcImc(sex : _sexoBool, age: valoresCampo['idade']?[1], weight: valoresCampo['peso']?[1], height: valoresCampo['altura']?[1]);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 0, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sexo',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Container(
                        child: Row(children: [
                          Text(
                            sexo,
                            style: TextStyle(
                              color: MyApp.getDefaultColor(),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Switch(
                            value: _sexoBool,
                            onChanged: ((bool value) {
                              setState(() {
                                _sexoBool = value;
                                sexo = _sexoBool ? 'Feminino' : 'Masculino';
                              });
                            }),
                            activeColor: MyApp.getDefaultColor(),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
                FormRow(
                  label: 'Digite sua idade',
                  unit: 'anos',
                  atualizarBotao: _verificarInputVazio,
                  callback: _callbackIdade,
                ),
                FormRow(
                  label: 'Digite seu peso',
                  unit: 'kg',
                  atualizarBotao: _verificarInputVazio,
                  callback: _callbackPeso,
                ),
                FormRow(
                  label: 'Digite sua altura',
                  unit: 'm',
                  atualizarBotao: _verificarInputVazio,
                  callback: _callbackAltura,
                ),
                OkButton(
                  data: "Calcular IMC",
                  onClick: _calcularDados,
                  getActiveButton: () => _botaoAtivo,
                ),
              ],
            ),
          )),
    );
  }
}
