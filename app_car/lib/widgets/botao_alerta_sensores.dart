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
  final String broker = '201.81.74.83';
  final int port = 1883;
  final String clientIdentifier = 'android-jp';

  const BotaoAlerta(this.icone, this.sensor, this.topic);

  @override
  _BotaoAlertaState createState() => _BotaoAlertaState();
}

class _BotaoAlertaState extends State<BotaoAlerta> {
  bool estado = false;
  // para desativar alarme mqtt
  bool estadoAlarme = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _connect());
  }

  void _subscribeToTopic(String topic) {
    if (connectionState == mqtt.MqttConnectionState.connected) {
      print('[MQTT client] Subscribing to ${topic.trim()}');
      client?.subscribe(topic, mqtt.MqttQos.exactlyOnce);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.topic == 'esp32Sensor/alarme') {
      return IconButton(
          icon: widget.icone,
          color: (estadoAlarme ? Colors.red : Colors.white),
          onPressed: () {
            if (client?.connectionState == MqttConnectionState.disconnected) {
              print("Entrou no if de conexão");
              this._connect();
            }
            print('verificar se vem true/false ${globals.status}');
            // if () {
            //   // estado no metodo publish foi substituido por estadoAlarme
            //    _publishMessageJSON(estadoAlarme);
            // }

            abrirDialogInfos(context, widget.sensor);
          });
    } else {
      return IconButton(
          icon: widget.icone,
          color: this.estado ? Colors.red : Colors.white,
          onPressed: () {
            if (client?.connectionState == MqttConnectionState.disconnected) {
              print("Entrou no if de coneção");
              this._connect();
            }
            if (client?.connectionState == MqttConnectionState.disconnected) {
              print("Entrou no if");
            }
            if (widget.topic == 'esp32Sensor/S/presenca' ||
                widget.topic == 'esp32Sensor/S/movimento') {
              abrirSensorInfo(context, widget.sensor);
            }
            // else {
            //   abrirDialogInfo(context, widget.sensor);
            // }
          });
    }
  }

  mqtt.MqttClient? client;
  mqtt.MqttConnectionState? connectionState;

  StreamSubscription? subscription;

  Future<void> _connect() async {
    client = MqttServerClient(widget.broker, '');
    client?.port = widget.port;
    client?.keepAlivePeriod = 30;
    client?.onDisconnected = _onDisconnected;

    final mqtt.MqttConnectMessage connMess = mqtt.MqttConnectMessage()
        .withClientIdentifier(widget.topic + widget.clientIdentifier)
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
    if (event[0].topic == widget.topic) {
      print(message);
      if (message.startsWith('{"sensorpre')) {
        var json = jsonDecode(message);
        var jsonSensor = SensorPreJson.fromJson(json);
        if (jsonSensor.sensor == true) {
          setState(() {
            if (this.estado == false && globals.status) {
              createMovimentNotification();
              print('notificacao presenca ${globals.status}');
            }
            this.estado = true;
          });
        } else {
          setState(() {
            this.estado = false;
          });
        }
      } else if (message.startsWith('{"sensormov')) {
        if (message.startsWith('{"sensormov')) {
          var json = jsonDecode(message);
          var jsonSensor = SensorMovJson.fromJson(json);
          if (jsonSensor.sensor == true) {
            setState(() {
              if (this.estado == false && globals.status) {
                createAcelerometerNotification();
                print('notificacao movimento ${globals.status}');
              }
              this.estado = true;
            });
          } else {
            setState(() {
              this.estado = false;
            });
          }
        } else if (message.startsWith('{"sensoral')) {
          if (message.startsWith('{"sensoral')) {
            var json = jsonDecode(message);
            var jsonSensor = SensorAlJson.fromJson(json);
            if (jsonSensor.sensor == true) {
              setState(() {
                this.estado = true;
              });
            } else {
              setState(() {
                this.estado = false;
              });
            }
          }
        }
      }
    }
  }

  void _publishMessage(String message) async {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client?.publishMessage(widget.topic, MqttQos.exactlyOnce, builder.payload!);
  }

  void _publishMessageJSON(bool estadoAlarme) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(json.encode({
      "sensoral": estadoAlarme,
    }));

    client?.publishMessage(widget.topic, MqttQos.exactlyOnce, builder.payload!);
    // setState(() {
    //   estado = !estado;
    // });
    print("Dentro do publicar, set state mudou para $estado");
  }

  bool toBoolean(String str, [bool strict = false]) {
    if (strict == true) {
      return str == '1' || str == 'true';
    }
    return str != '0' && str != 'false' && str != '';
  }

// Dialog da campainha:
  abrirDialogInfos(BuildContext context, String sensor) {
    mqtt.MqttClient? client;
    final String topic;

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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cencelar'),
                  style: ElevatedButton.styleFrom(primary: Colors.red[100]),
                ),
                ElevatedButton(
                  child: (estadoAlarme ? Text('Desativar') : Text('Ativar')),
                  style: ElevatedButton.styleFrom(primary: Colors.green[100]),
                  onPressed: () {
                    print('estadoAlarme antes: ${estadoAlarme}');
                    setState(() {
                      estadoAlarme = !estadoAlarme;
                      _publishMessageJSON(estadoAlarme);
                    });
                    print('estadoAlarme depois: ${estadoAlarme}');

                    Navigator.pop(context);
                    if (globals.status) {
                      createAlarmNotification(estadoAlarme);
                      print('notificacao alarme ${globals.status}');
                    }
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
