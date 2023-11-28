import 'package:flutter/material.dart';

class FormRow extends StatefulWidget {
  final String label;
  final String unit;
  bool estaVazio = true;
  final void Function() atualizarBotao;
  final void Function(bool boolValor, double valor) callback;
  FormRow(
      {super.key,
      required this.label,
      required this.unit,
      required this.callback,
      required this.atualizarBotao});

  @override
  State<FormRow> createState() => _FormRowState();
}

class _FormRowState extends State<FormRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15.0),
              child: TextField(
                onChanged: (value) => setState(() {
                  if (value == "") {
                    widget.callback(false, double.tryParse(value)??0);
                  } else {
                    widget.callback(true, double.tryParse(value)??0);
                  }
                  widget.atualizarBotao();
                }),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    label: Text.rich(TextSpan(children: <InlineSpan>[
                  WidgetSpan(child: Text(widget.label)),
                  const WidgetSpan(
                    child: Text(' *', style: TextStyle(color: Colors.red)),
                  ),
                ]))),
              ),
            ),
          ),
          Text(
            widget.unit,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
