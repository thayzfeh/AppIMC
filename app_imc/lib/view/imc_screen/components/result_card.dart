import 'package:flutter/material.dart';
import 'package:app_imc/view/styles/text_style.dart';

class ResultCard extends StatefulWidget {
  late final Map data;
  ResultCard({super.key, required this.data});

  @override
  State<ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          height: MediaQuery.of(context).size.height / 3.5,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.data['imc'],
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: widget.data['cor']),
                          ),
                          Text("Seu IMC"),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          widget.data['descricao'],
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text("Peso ideal para sua altura"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(widget.data['pesoMin'], style: boldText()),
                          Text("Mínimo"),
                        ],
                      ),
                      Column(
                        children: [
                          Text(widget.data['pesoMax'], style: boldText()),
                          Text("Máximo")
                        ],
                      )
                    ],
                  ),
                ]),
          )),
    );
  }
}
