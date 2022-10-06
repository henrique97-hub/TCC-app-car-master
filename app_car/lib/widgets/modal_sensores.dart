import 'package:flutter/material.dart';

abrirSensorInfo(BuildContext context, String sensor) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Este simbolo representa o ${sensor}'),
          content: Text(
              'Este ícone representa o sensor de presença ${sensor}. Por aqui, você consegue acompanhar se o mesmo está ativado ou desativado.'),
          actions: [
              FlatButton(
              textColor: Color(0xFF6200EE),
              onPressed: () {
                Navigator.of(context).pop();
              },
          child: Text('OK'),
        ),
      ],
    );
  });
}