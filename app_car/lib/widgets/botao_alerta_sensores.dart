// // ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'dart:convert';
import 'package:app_car/ui/pagina_configuracoes.dart';
import 'package:app_car/widgets/modal_alarme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:app_car/widgets/mqtt_json.dart';

class BotaoAlerta extends StatefulWidget {
  
  // @override
  final Icon icone;
  final String sensor;
  final String topic;
  final  String broker = '201.81.74.83';
  final  int port = 1883;
  final String clientIdentifier = 'android-jp';
  
  const BotaoAlerta(this.icone, this.sensor, this.topic);

  
  
  @override
  _BotaoAlertaState createState() => _BotaoAlertaState();
  
  
  
}
  class _BotaoAlertaState extends State<BotaoAlerta> {
  bool estado = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _connect());
  }

  void _subscribeToTopic(String topic) {
    if (connectionState == mqtt.MqttConnectionState.connected) {
        print('[MQTT client] Subscribing to ${topic.trim()}');
        client?.subscribe(topic, mqtt.MqttQos.exactlyOnce);
    }
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: widget.icone,
      color: estado 
        ? Colors.white 
        : Colors.red,
      onPressed: () {
        if (widget.topic == 'esp32Sensor/comunicacao'){
          _connect();
          _publishMessage('$estado');
          estado= !estado;
        }else{
            print('$estado agora fazendo o teste no pressed' );
            _connect();
            setState(() {
            estado = !estado;
          });
        }
        abrirDialogInfo(context, widget.sensor);
      },
    );
  }

  mqtt.MqttClient? client;
  mqtt.MqttConnectionState? connectionState;

  StreamSubscription? subscription;

  @override
  void _connect() async {
    client = MqttServerClient(widget.broker, '');
    client?.port = widget.port;
    client?.keepAlivePeriod = 30;
    client?.onDisconnected = _onDisconnected;

    final mqtt.MqttConnectMessage connMess = mqtt.MqttConnectMessage()
        .withClientIdentifier(widget.clientIdentifier)
        .startClean() // Non persistent session for testing
        .keepAliveFor(30)
        .withWillQos(mqtt.MqttQos.atMostOnce);
    print('[MQTT client] MQTT client connecting....');
    client?.connectionMessage = connMess;

    try {
      await client?.connect();
    } catch (e) {
      print(e);
      _disconnect();
    }

    /// Check if we are connected
    if (client?.connectionState == mqtt.MqttConnectionState.connected) {
      print('[MQTT client] connected');
      setState(() {
        connectionState = client?.connectionState;
      });
    } else {
      print('[MQTT client] ERROR: MQTT client connection failed - '
          'disconnecting, state is ${client?.connectionState}');
      _disconnect();
    }

    subscription = client?.updates?.listen(_onMessageConect);
    _subscribeToTopic(widget.topic);
  }

  /*
  Desconecta do servidor MQTT
   */
  void _disconnect() {
    print('[MQTT client] _disconnect()');
    client?.disconnect();
    _onDisconnected();
  }

  /*
  Executa algo quando desconectado, no caso, zera as variáveis e imprime msg no console
   */
  void _onDisconnected() {
    print('[MQTT client] _onDisconnected');
    setState(() {
      connectionState = client?.connectionState;
      client = MqttServerClient('0', '');;
      subscription?.cancel();
      subscription = null;
    });
    print('[MQTT client] MQTT client disconnected');
  }

  void _onMessageConect(List<mqtt.MqttReceivedMessage> event) {
    print(event.length);
    final mqtt.MqttPublishMessage recMess =
    event[0].payload as mqtt.MqttPublishMessage;
    String message =
    mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    print('[MQTT client] MQTT message: topic is <${event[0].topic}>, ''payload is <-- ${message} -->');
    print(client?.connectionState);
    print("[MQTT client] message with topic: ${event[0].topic}");
    print("[MQTT client] message with message: ${message}");
    message = message.toLowerCase();
    print('$message antes do setState');
    // estado= true;
    // message = 'true';
    // print('$estado este é o estado');
    // var estado2 = true;
    // estado2 = bool.fromEnvironment(message);
    // print('$estado2 esse é o estado2');
    // estado = true;
    // print('$estado esse é o estado');
    // setState(() {
    // });
    // print(estado.runtimeType);
    // print('$estado deveria estar diferente' );
    if (message == 'true'){
      setState(() {
        estado = true;
      });
    }else{
      setState(() {
        estado = false;
      });
    }
  }
  
  void _publishMessage(String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(
      json.encode(
      {
        "message": message,
      }
    )
    );
    client?.publishMessage(widget.topic, MqttQos.exactlyOnce, builder.payload!);
  }

}
