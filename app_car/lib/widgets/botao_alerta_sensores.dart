// // ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'dart:convert';
import 'package:app_car/ui/pagina_configuracoes.dart';
import 'package:app_car/widgets/modal_alarme.dart';
import 'package:app_car/widgets/modal_sensores.dart';
import 'package:app_car/widgets/mqtt_json.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:app_car/widgets/notifications.dart';
import 'package:app_car/widgets/globals.dart' as globals;

class BotaoAlerta extends StatefulWidget {
  
  @override
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

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance!
  //       .addPostFrameCallback((_) => _connect());
  //   AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
  //     if (!isAllowed) {
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: const Text('Allow Notifications'),
  //           content: const Text('Our app would like to send you notifications'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: const Text(
  //                 'Don\'t Allow',
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 18,
  //                 ),
  //               ),
  //             ),
  //             TextButton(
  //                 onPressed: () => AwesomeNotifications()
  //                     .requestPermissionToSendNotifications()
  //                     .then((_) => Navigator.pop(context)),
  //                 child: const Text(
  //                   'Allow',
  //                   style: TextStyle(
  //                     color: Colors.teal,
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ))
  //           ],
  //         ),
  //       );
  //     }
  //   });
  // }

  void _subscribeToTopic(String topic) {
    if (connectionState == mqtt.MqttConnectionState.connected) {
        print('[MQTT client] Subscribing to ${topic.trim()}');
        client?.subscribe(topic, mqtt.MqttQos.exactlyOnce);
    }
  }
  @override

  Widget build(BuildContext context) {
    if (widget.topic == 'esp32Sensor/alarme'){
      return IconButton(
      icon: widget.icone,
      color: estado 
        ? Colors.red 
        : Colors.white,
      onPressed: (){
        print(globals.status);
        if(globals.status == true){
          print("O estado é $estado");
          _publishMessageJSON(estado);
          setState(() {
            estado = !estado;
          });
          if(estado == true){
            createAlarmNotification();
          }
        }
      });
    }else{
      return IconButton(
      icon: widget.icone,
      color: estado 
        ? Colors.red 
        : Colors.white,
      onPressed: (){
        if (widget.topic == 'esp32Sensor/S/presenca' || widget.topic == 'esp32Sensor/S/movimento') {
          abrirSensorInfo(context, widget.sensor);
        }else{
          abrirDialogInfo(context, widget.sensor);
        }
      });
    // return IconButton(
    //   icon: widget.icone,
    //   color: estado 
    //     ? Colors.red 
    //     : Colors.white,
    //   onPressed: (){
    //     print(globals.status);
    //     if(globals.status == true){
    //     if (widget.topic == 'esp32Sensor/alarme'){
    //       print("O estado é $estado");
    //       _publishMessageJSON(estado);
    //       if(estado == true){
    //         createAlarmNotification();
    //       }
    //       setState(() {
    //         estado = !estado;
    //       });
    //     }else{
    //         if (widget.topic == 'esp32Sensor/S/presenca'){
    //           createMovimentNotification();
    //         }else if(widget.topic =='esp32Sensor/S/movimento'){
    //           createAcelerometerNotification();
    //         }
    //         setState(() {
    //         estado = !estado;
    //       });
    //       }
    //     }
    //     abrirDialogInfo(context, widget.sensor);
    //   },
    // );
    }
  }

  mqtt.MqttClient? client;
  mqtt.MqttConnectionState? connectionState;

  StreamSubscription? subscription;

  Future <void> _connect() async {
    client = MqttServerClient(widget.broker, '');
    client?.port = widget.port;
    client?.keepAlivePeriod = 30;
    client?.onDisconnected = _onDisconnected;

    final mqtt.MqttConnectMessage connMess = mqtt.MqttConnectMessage()
        .withClientIdentifier(widget.clientIdentifier)
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
 
  void _disconnect() {
    print('[MQTT client] _disconnect()');
    client?.disconnect();
    _onDisconnected();
  }

  void _onDisconnected() {
    setState(() {
      connectionState = client?.connectionState;
      client = MqttServerClient('0', '');
      subscription?.cancel();
      subscription = null;
    });
    print('[MQTT client] MQTT client disconnected');
  }

  void _onMessageConect(List<mqtt.MqttReceivedMessage> event) {
    final mqtt.MqttPublishMessage recMess =
    event[0].payload as mqtt.MqttPublishMessage;
    String message =
    mqtt.MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    if (message == "sensor") {
      var json = jsonDecode(message);
      var jsonSensor = SensorJson.fromJson(json);
      if (jsonSensor.sensor == true){
      setState(() {
        estado = true;
      });
      }else{
      setState(() {
        estado = false;
      });
      }
    }
  }
  
  void _publishMessage(String message) async {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client?.publishMessage(widget.topic, MqttQos.exactlyOnce, builder.payload!);
  }

  void _publishMessageJSON(bool estado) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
      builder.addString(
        json.encode(
        {
          "sensor": estado,
        }
      )
    );
    
  client?.publishMessage(widget.topic, MqttQos.exactlyOnce, builder.payload!);
  setState(() {
            estado=!estado;
          });
  print("Dentro do publicar, set state mudou para $estado");
  }

  bool toBoolean(String str, [bool strict = false]) {
  if (strict == true) {
    return str == '1' || str == 'true';
  }
  return str != '0' && str != 'false' && str != '';
  }

}
