// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_print
import 'dart:async';

import 'package:app_car/ui/camera_externa.dart';
import 'package:app_car/ui/camera_interna.dart';
import 'package:app_car/widgets/botao_acesso_camera.dart';
import 'package:app_car/widgets/botao_alerta_sensores.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String topic = 'esp32Sensor/status';
  String topic2 = 'esp32Sensor/alarme';
  String topic3 = 'esp32Sensor/S/presenca';
  String topic4 = 'esp32Sensor/S/movimento';
  String topic5 = 'esp32Sensor/S/GPS';
  String topic6 = 'esp32Sensor/comunicacao';

  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy - HH:mm:ss');
    final String formatted = formatter.format(now);
    final ThemeData tema = ThemeData(brightness: Brightness.dark);

    return Scaffold(
      backgroundColor: tema.backgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text("Configurações"),
        ),
        leading: IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Selecionar veículos',
                  textAlign: TextAlign.right,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: const Image(
                    image: AssetImage('assets/images/carApp.png'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          SizedBox(height: 20),
          Card(
            color: Colors.grey[800],
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.update,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Atualizado em ${formatted}",
                        style: TextStyle(color: Colors.white),
                      ),
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
              children: [
                BotaoAlerta(Icon(Icons.campaign), 'campainha', topic2),
                BotaoAlerta(Icon(Icons.phone), 'telefone', topic3),
                BotaoAlerta(Icon(Icons.album), 'gravação', topic4),
                BotaoAlerta(Icon(Icons.map), 'GPS', topic5),
              ],
            ),
          ),
          SizedBox(height: 20),
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
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}
