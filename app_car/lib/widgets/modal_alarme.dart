import 'package:flutter/material.dart';

abrirDialogInfo(BuildContext context, String sensor) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.grey,
        title: Text('Deseja ativar esse ${sensor}?'),
        content: Text(
            'Esse botão permite que o usuário ative o ${sensor} em tempo real.'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Cencelar'),
                style: ElevatedButton.styleFrom(primary: Colors.red[100]),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Ativar'),
                style: ElevatedButton.styleFrom(primary: Colors.green[100]),
              ),
            ],
          ),

          // FlatButton(
          //   textColor: Color(0xFF6200EE),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          //   child: Text('CANCELAR'),
          // ),

          // FlatButton(
          //   textColor: Color(0xFF6200EE),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          //   child: Text('ATIVAR'),
          // ),
        ],
      );
    },
  );
}
