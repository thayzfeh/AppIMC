import 'package:flutter/material.dart';

 dynamic calcularIMC(
      {required bool sexoFem,
      required int idade,
      required double peso,
      required double altura}) {
    const List cores = [
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.redAccent,
      Colors.red
    ];
    const List descricoes = [
      "Você está abaixo do peso ideal",
      "Parabéns - você está em seu peso normal",
      "Você está acima do seu peso (sobrepeso)",
      "Você está com o peso acima do grau I",
      "Você está com o peso acima do grau II",
      "Você está com o peso acima do grau III"
    ];
    const pesoMasc = {
      '155': [50.0, 58.2],
      '156': [50.7, 58.8],
      '157': [51.4, 59.5],
      '158': [51.8, 60.0],
      '159': [52.2, 60.5],
      '160': [52.7, 60.9],
      '161': [53.2, 61.5],
      '162': [53.7, 62.1],
      '163': [54.1, 62.7],
      '164': [55.0, 63.4],
      '165': [55.9, 64.1],
      '166': [56.5, 64.8],
      '167': [57.1, 65.6],
      '168': [57.7, 66.4],
      '169': [58.6, 67.5],
      '170': [59.5, 68.6],
      '171': [60.1, 69.2],
      '172': [60.7, 69.8],
      '173': [61.4, 70.5],
      '174': [62.3, 71.4],
      '175': [63.2, 72.3],
      '176': [63.8, 72.9],
      '177': [64.4, 73.5],
      '178': [65.0, 74.1],
      '179': [65.9, 75.3],
      '180': [66.8, 76.4],
      '181': [67.4, 77.1],
      '182': [68.0, 77.8],
      '183': [68.6, 78.6],
      '184': [69.8, 79.8],
      '185': [70.9, 80.9],
      '186': [71.5, 81.7],
      '187': [72.1, 82.5],
      '188': [72.7, 83.2],
      '189': [73.3, 83.8],
      '190': [73.9, 84.4]
    };
    const pesoFem = {
      '150': [45.5, 53.2],
      '151': [46.2, 54.0],
      '152': [46.8, 54.5],
      '153': [47.3, 55.0],
      '154': [47.8, 55.5],
      '155': [48.2, 55.9],
      '156': [48.9, 56.8],
      '157': [49.5, 57.7],
      '158': [50.0, 58.3],
      '159': [50.5, 58.9],
      '160': [50.9, 59.5],
      '161': [51.5, 60.1],
      '162': [52.1, 60.7],
      '163': [52.7, 61.4],
      '164': [53.6, 62.3],
      '165': [54.5, 63.2],
      '166': [55.1, 63.8],
      '167': [55.7, 64.4],
      '168': [56.4, 65.0],
      '169': [57.3, 65.9],
      '170': [58.2, 66.8],
      '171': [58.8, 67.4],
      '172': [59.4, 68.0],
      '173': [60.0, 68.6],
      '174': [60.9, 69.8],
      '175': [61.8, 70.9],
      '176': [62.4, 71.7],
      '177': [63.0, 72.5],
      '178': [63.6, 73.2],
      '179': [64.5, 74.1],
      '180': [65.5, 75.0],
      '181': [66.1, 75.6],
      '182': [66.7, 76.2],
      '183': [67.3, 76.8]
    };
    double imc = peso / (altura * altura);
    altura = altura * 100;
    Color cor;
    int indexImc;
    String descricao;
    if (sexoFem) {
      altura = altura < 150
          ? 150
          : altura > 183
              ? 183
              : altura;
      switch (imc) {
        case < 18.5:
          {
            indexImc = 0;
          }
          break;
        case >= 18.6 && <= 23.9:
          {
            indexImc = 1;
          }
          break;
        case >= 24 && <= 28.9:
          {
            indexImc = 2;
          }
          break;
        case >= 29 && < 34.9:
          {
            indexImc = 3;
          }
          break;
        case >= 35 && <= 39.9:
          {
            indexImc = 4;
          }
          break;
        default:
          {
            indexImc = 5;
          }
      }
    } else {
      altura = altura < 155
          ? 155
          : altura > 190
              ? 190
              : altura;
      switch (imc) {
        case < 20:
          {
            indexImc = 0;
          }
          break;
        case >= 20 && <= 24.9:
          {
            indexImc = 1;
          }
          break;
        case >= 25 && <= 29.9:
          {
            indexImc = 2;
          }
          break;
        case >= 30 && < 35.9:
          {
            indexImc = 3;
          }
          break;
        case >= 36 && <= 42:
          {
            indexImc = 4;
          }
          break;
        default:
          {
            indexImc = 5;
          }
      }
    }
    cor = cores[indexImc];
    descricao = descricoes[indexImc];
    List<double>? pesoIdeal =
        sexoFem ? pesoFem[altura.toString()] : pesoMasc[altura.toString()];

    return {
      'imc': imc.toStringAsFixed(2),
      'descricao': descricao.toString(),
      'pesoMin': pesoIdeal?[0].toString(),
      'pesoMax': pesoIdeal?[1].toString(),
      'cor': cor
    };
  }

