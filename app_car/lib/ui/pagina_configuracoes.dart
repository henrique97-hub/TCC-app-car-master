// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:convert';
import 'package:app_car/ui/camera_externa.dart';
import 'package:app_car/ui/camera_interna.dart';
import 'package:app_car/ui/pagina_login.dart';
import 'package:app_car/widgets/botao_acesso_camera.dart';
import 'package:app_car/widgets/botao_alerta_sensores.dart';
import 'package:app_car/widgets/bottomNavigation.dart';
import 'package:app_car/widgets/botoes_rodape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:mqtt_client/mqtt_server_client.dart';

class HomePage extends StatefulWidget {
  final int __opcaoSelecionada = 1;
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // String broker = '201.81.74.83';
  // int port = 1503;
  // String clientIdentifier = 'android-jp';
  // String topic = 'esp32Sensor/status';
  // String topic2 = 'esp32Sensor/alarme';
  // String topic3 = 'esp32Sensor/S/Presencia';
  // String topic4 = 'esp32Sensor/S/movimento';
  // String topic5 = 'esp32Sensor/S/GPS';

  // late mqtt.MqttClient client;
  // late mqtt.MqttConnectionState connectionState;

  // late StreamSubscription subscription1;
  // late StreamSubscription subscription2;
  // late StreamSubscription subscription3;
  // late StreamSubscription subscription4;
  // late StreamSubscription subscription5;

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance!.addPostFrameCallback((_) => _connect());
  // }

  // void _subscribeToTopic(String topic) {
  //   if (connectionState == mqtt.MqttConnectionState.connected) {
  //     print('[MQTT client] Subscribing to ${topic.trim()}');
  //     client.subscribe(topic, mqtt.MqttQos.exactlyOnce);
  //   }
  // }

  // bool _pres = false;
  // bool _buzz = false;
  // bool _mov = false;
  // bool _conect = false;
  // String _GPS = '';

  Widget build(BuildContext context) {
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
                    image: AssetImage('images/carApp.png'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Atualizado em 25/06/2022 ás 16:55",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          Card(
            color: Colors.grey[800],
            child: Expanded(
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.battery_charging_full_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Saúde da bateria externa 98% ",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.grey[600],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BotaoAlerta(
                  Icon(Icons.campaign, color: Colors.white),
                ),
                BotaoAlerta(
                  Icon(Icons.phone, color: Colors.white),
                ),
                BotaoAlerta(
                  Icon(Icons.album, color: Colors.white),
                ),
                BotaoAlerta(
                  Icon(Icons.map, color: Colors.white),
                ),
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
                  ExternalCameras())
            ],
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }

  // void _connect() async {
  //   client = MqttServerClient(broker, clientIdentifier);
  //   client.port = port;
  //   client.keepAlivePeriod = 30;
  //   client.onDisconnected = _onDisconnected;

  //   final mqtt.MqttConnectMessage connMess = mqtt.MqttConnectMessage()
  //       .withClientIdentifier(clientIdentifier)
  //       .startClean() // Non persistent session for testing
  //       .keepAliveFor(30)
  //       .withWillQos(mqtt.MqttQos.atMostOnce);
  //   print('[MQTT client] MQTT client connecting....');
  //   client.connectionMessage = connMess;

  //   try {
  //     await client.connect();
  //   } catch (e) {
  //     print("erro");
  //     _disconnect();
  //   }

  //   /// Check if we are connected
  //   if (client.connectionState == mqtt.MqttConnectionState.connected) {
  //     print('[MQTT client] connected');
  //     setState(() {
  //       connectionState = client.connectionState!;
  //     });
  //   } else {
  //     print('[MQTT client] ERROR: MQTT client connection failed - '
  //         'disconnecting, state is ${client.connectionState}');
  //     _disconnect();
  //   }

  //   subscription1 = client.updates!.listen(_onMessageConect);
  //   _subscribeToTopic(topic);
  //   subscription2 = client.updates!.listen(_onMessagePres);
  //   _subscribeToTopic(topic2);
  //   subscription3 = client.updates!.listen(_onMessageBuzz);
  //   _subscribeToTopic(topic3);
  //   subscription4 = client.updates!.listen(_onMessageMov);
  //   _subscribeToTopic(topic4);
  //   subscription5 = client.updates!.listen(_onMessageGPS);
  //   _subscribeToTopic(topic5);
  // }

  // void _disconnect() {
  //   print('[MQTT client] _disconnect()');
  //   client.disconnect();
  //   _onDisconnected();
  // }

  // void _onDisconnected() {
  //   print('[MQTT client] _onDisconnected');
  //   setState(() {
  //     //topics.clear();
  //     connectionState = client.connectionState!;
  //     client = 0 as mqtt.MqttClient;
  //     subscription1.cancel();
  //     subscription1 = 0 as StreamSubscription;
  //   });
  //   print('[MQTT client] MQTT client disconnected');
  // }

  // void _onMessageConect(List<mqtt.MqttReceivedMessage> event) {
  //   print(event.length);
  //   final mqtt.MqttPublishMessage recMess =
  //       event[0].payload as mqtt.MqttPublishMessage;
  //   final String message =
  //       mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
  //   print('[MQTT client] MQTT message: topic is <${event[0].topic}>, '
  //       'payload is <-- ${message} -->');
  //   print(client.connectionState);
  //   print("[MQTT client] message with topic: ${event[0].topic}");
  //   print("[MQTT client] message with message: ${message}");
  //   setState(() {
  //     _conect = bool.fromEnvironment(message);
  //   });
  // }

  // void _onMessagePres(List<mqtt.MqttReceivedMessage> event) {
  //   print(event.length);
  //   final mqtt.MqttPublishMessage recMess =
  //       event[0].payload as mqtt.MqttPublishMessage;
  //   final String message =
  //       mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
  //   print('[MQTT client] MQTT message: topic is <${event[0].topic}>, '
  //       'payload is <-- ${message} -->');
  //   print(client.connectionState);
  //   print("[MQTT client] message with topic: ${event[0].topic}");
  //   print("[MQTT client] message with message: ${message}");
  //   setState(() {
  //     _pres = bool.fromEnvironment(message);
  //   });
  // }

  // void _onMessageBuzz(List<mqtt.MqttReceivedMessage> event) {
  //   print(event.length);
  //   final mqtt.MqttPublishMessage recMess =
  //       event[0].payload as mqtt.MqttPublishMessage;
  //   final String message =
  //       mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
  //   print('[MQTT client] MQTT message: topic is <${event[0].topic}>, '
  //       'payload is <-- ${message} -->');
  //   print(client.connectionState);
  //   print("[MQTT client] message with topic: ${event[0].topic}");
  //   print("[MQTT client] message with message: ${message}");
  //   setState(() {
  //     _buzz = bool.fromEnvironment(message);
  //   });
  // }

  // void _onMessageMov(List<mqtt.MqttReceivedMessage> event) {
  //   print(event.length);
  //   final mqtt.MqttPublishMessage recMess =
  //       event[0].payload as mqtt.MqttPublishMessage;
  //   final String message =
  //       mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
  //   print('[MQTT client] MQTT message: topic is <${event[0].topic}>, '
  //       'payload is <-- ${message} -->');
  //   print(client.connectionState);
  //   print("[MQTT client] message with topic: ${event[0].topic}");
  //   print("[MQTT client] message with message: ${message}");
  //   setState(() {
  //     _mov = bool.fromEnvironment(message);
  //   });
  // }

  // void _onMessageGPS(List<mqtt.MqttReceivedMessage> event) {
  //   print(event.length);
  //   final mqtt.MqttPublishMessage recMess =
  //       event[0].payload as mqtt.MqttPublishMessage;
  //   final String message =
  //       mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
  //   print('[MQTT client] MQTT message: topic is <${event[0].topic}>, '
  //       'payload is <-- ${message} -->');
  //   print(client.connectionState);
  //   print("[MQTT client] message with topic: ${event[0].topic}");
  //   print("[MQTT client] message with message: ${message}");
  //   setState(() {
  //     _GPS = String.fromEnvironment(message);
  //   });
  // }
}
