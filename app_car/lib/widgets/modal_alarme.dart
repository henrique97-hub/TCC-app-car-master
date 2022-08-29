import 'package:flutter/material.dart';

abrirDialogInfo(BuildContext context, String sensor) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deseja ativar esse ${sensor}?'),
          content: Text(
              'Esse botão permite que o usuário ative o ${sensor} em tempo real.'),
          actions: [
            FlatButton(
              textColor: Color(0xFF6200EE),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CANCELAR'),
            ),
            FlatButton(
              textColor: Color(0xFF6200EE),
              onPressed: () {
                Navigator.of(context).pop();
                print("Alarme ativado!");
              },
              child: Text('ATIVAR'),
            ),
          ],
        );
      });
}