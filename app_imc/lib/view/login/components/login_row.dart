import 'package:flutter/material.dart';

class LoginRow extends StatefulWidget {
  final String label;
  final bool isPass;
  bool estaVazio = true;
  final void Function() atualizarBotao;
  final void Function(bool boolValor, dynamic valor) callback;
  LoginRow(
      {super.key,
      required this.isPass,
      required this.label,
      required this.callback,
      required this.atualizarBotao});

  @override
  State<LoginRow> createState() => _LoginRowState();
}

class _LoginRowState extends State<LoginRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 30.0),
              child: TextField(
                onChanged: (value) => setState(() {
                  if (value == "") {
                    widget.callback(false, value);
                  } else {
                    widget.callback(true, value);
                  }
                  widget.atualizarBotao();
                }),
                obscureText: widget.isPass,
                decoration: InputDecoration(
                    label: Text.rich(TextSpan(children: <InlineSpan>[
                      WidgetSpan(
                          child: Text(
                        widget.label,
                      )),
                      const WidgetSpan(
                        child: Text(' *', style: TextStyle(color: Colors.red)),
                      ),
                    ])),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
