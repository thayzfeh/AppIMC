import 'package:app_imc/main.dart';
import 'package:flutter/material.dart';
import '../../model/imc_calc.dart';
import 'components/app_title.dart';
import 'components/form_card.dart';
import 'components/result_card.dart';

class ImcScreen extends StatefulWidget {
  const ImcScreen({super.key});

  @override
  State<ImcScreen> createState() => _ImcScreen();
}

class _ImcScreen extends State<ImcScreen> {
  Map data = {
    'imc': "",
    'descricao': "",
    'pesoMin': "",
    'pesoMax': "",
    'cor': Colors.black
  };
  void _calcData({required bool sex,required int age,required double weight,required double height}) {
    setState(() {
    if (elementsList.length > 2) {
      elementsList.removeLast();
    }
    elementsList.add(ResultCard(data: calcularIMC(sexoFem: sex, idade: age, peso: weight, altura: height)));
    });

  }
  List<Widget> elementsList = [
    AppTitle(data: 'Calculadora de IMC',color: MyApp.getDefaultColor(),),
  ];

  @override
  Widget build(BuildContext context) {
    if(elementsList.length == 1){
      elementsList.add(FormCard(calcImc: _calcData));
    }
    return Container(
      color: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: elementsList,
      ),
    );
  }
}
