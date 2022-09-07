import 'package:app_car/ui/pagina_configuracoes.dart';
import 'package:app_car/widgets/modal_alarme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotaoAlerta extends StatelessWidget {
  final Icon icone;
  final String sensor;

  const BotaoAlerta(this.icone, this.sensor);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icone,
      onPressed: () {
        abrirDialogInfo(context, sensor);
      },
    );
  }
}
