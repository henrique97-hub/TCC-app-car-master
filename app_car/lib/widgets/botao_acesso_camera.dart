import 'package:flutter/material.dart';

class BotaoCamera extends StatelessWidget {
  final String labelTitulo;
  final String labelBotao;
  final Icon icone;
  final Widget navegacao;

  const BotaoCamera(
      this.labelBotao, this.labelTitulo, this.icone, this.navegacao);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: 120,
      width: 140,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => navegacao,
            ),
          );
        },
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(2.0)),
            icone,
            Text(
              labelTitulo,
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              labelBotao,
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.start,
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0)),
        ),
      ),
    );
  }
}
