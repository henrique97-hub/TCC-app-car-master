// https://pub.dev/packages/date_format/example

import 'package:app_car/ui/camera_externa.dart';
import 'package:app_car/ui/camera_interna.dart';
import 'package:app_car/widgets/botao_acesso_camera.dart';
import 'package:app_car/widgets/botao_alerta_sensores.dart';
import 'package:app_car/widgets/botoes_rodape.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GpsAcesso extends StatefulWidget {
  // const GpsAcesso({Key? key}) : super(key: key);

  @override
  State<GpsAcesso> createState() => _GpsAcessoState();
}

class _GpsAcessoState extends State<GpsAcesso> {
  String topic = 'esp32Sensor/status';
  String topic2 = 'esp32Sensor/alarme';
  String topic3 = 'esp32Sensor/S/presenca';
  String topic4 = 'esp32Sensor/S/movimento';
  String topic5 = 'esp32Sensor/S/GPS';
  String topic6 = 'esp32Sensor/comunicacao';

  @override
  Widget build(BuildContext context) {
    // final today = DateTime.now().day;
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy - HH:mm:ss');
    final String formatted = formatter.format(now);

    final ThemeData tema = ThemeData(brightness: Brightness.dark);
    return Scaffold(
      backgroundColor: tema.backgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text("Acesso ao GPS"),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.keyboard_return_rounded),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => BotaoRodape(),
              ),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/gps.png'),
            ),
          ),
          SizedBox(height: 5),
          SizedBox(height: 40),
          Card(
            color: Colors.grey[800],
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.update,
                          color: Colors.white,
                        ),
                      ),
                      Text("Atualizado em ${formatted} ",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: Colors.grey[600],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                BotaoAlerta(Icon(Icons.campaign), 'campainha', topic2),
                BotaoAlerta(Icon(Icons.phone), 'telefone', topic3),
                BotaoAlerta(Icon(Icons.album), 'gravação', topic4),
                BotaoAlerta(Icon(Icons.map), 'GPS', topic5),
              ],
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BotaoCamera(
                'Acompanhe o que acontece dentro do seu veículo',
                'Câmeras internas',
                Icon(Icons.camera_alt),
                InternalCameras(),
              ),
              BotaoCamera(
                'Acompanhe o que acontece fora do seu veículo',
                'Câmeras externas',
                Icon(Icons.camera_outdoor),
                ExternalCameras(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
