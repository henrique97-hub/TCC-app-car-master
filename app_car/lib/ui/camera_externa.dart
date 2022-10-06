// // ignore_for_file: prefer_const_constructors


// import do mqtt_client
import 'package:app_car/ui/camera_interna.dart';
import 'package:app_car/widgets/botao_acesso_camera.dart';
import 'package:app_car/widgets/botao_alerta_sensores.dart';
import 'package:app_car/widgets/botoes_rodape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_car/widgets/globals.dart' as globals;

class ExternalCameras extends StatefulWidget {
  const ExternalCameras({Key? key}) : super(key: key);

  @override
  State<ExternalCameras> createState() => _ExternalCamerasState();
}

class _ExternalCamerasState extends State<ExternalCameras> {
  String topic = 'esp32Sensor/status';
  String topic2 = 'esp32Sensor/alarme';
  String topic3 = 'esp32Sensor/S/presenca';
  String topic4 = 'esp32Sensor/S/movimento';
  String topic5 = 'esp32Sensor/S/GPS';
  String topic6 = 'esp32Sensor/comunicacao';

  @override
  Widget build(BuildContext context) {
    var isRunning = true;
    final ThemeData tema = ThemeData(brightness: Brightness.dark);

    return Scaffold(
      backgroundColor: tema.backgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text("Câmeras Externas"),
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
            child: Mjpeg(
              isLive: isRunning,
              error: (context, error, stack) {
                print(error);
                print(stack);
                return Text(error.toString(),
                    style: TextStyle(color: Colors.red));
              },
              stream: 'http://192.168.164.84:81/stream',
              // stream: 'http://192.168.0.112:81/stream',
              timeout: const Duration(seconds: 60),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(height: 60),
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
                      Text("Atualizado em 25/06/2022 ás 16:55",
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
                BotaoAlerta(
                  Icon(Icons.campaign),'campainha', topic2
                ),
                BotaoAlerta(
                  Icon(Icons.sensors), 'Sensor de Movimento', topic3
                ),
                IconButton(
                  icon: Icon(Icons.phone), 
                  color: Colors.white,
                  onPressed: () {
                  String telefone =  '190';
                  final Uri _url = Uri.parse('tel://$telefone');
                  launchUrl(_url);
                  // createAlarmNotification();
                  },
                ),
                BotaoAlerta(
                  Icon(Icons.double_arrow), 'Sensor de Presença', topic4
                ),
                BotaoAlerta(
                  Icon(Icons.map), 'GPS', topic5
                ),

              ],
            ),
          ),
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
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
      // bottomNavigationBar:  BottomNavigation(),
    );
  }
}
