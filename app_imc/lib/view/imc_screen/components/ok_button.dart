import 'package:flutter/material.dart';
import 'package:app_imc/main.dart';

class OkButton extends StatefulWidget {
  final void Function() calcularDados;
  final bool Function() getActiveButton;
  const OkButton({super.key, required this.calcularDados, required this.getActiveButton});

  @override
  State<OkButton> createState() => _OkButtonState();
}

class _OkButtonState extends State<OkButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 30,
        child: ElevatedButton(
          child: Text("Calcular IMC"),
          onPressed: widget.getActiveButton()
                              ? () => {
                                    widget.calcularDados()
                                  }
                              : null,
          style: ButtonStyle(
            backgroundColor: widget.getActiveButton()
                ? MaterialStatePropertyAll<Color>(MyApp.getDefaultColor())
                : MaterialStatePropertyAll<Color>(
                    const Color.fromARGB(255, 212, 212, 212)),
          ),
        ),
      ),
    );
  }
}
