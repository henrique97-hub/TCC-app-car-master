import 'dart:convert';

import 'package:app_car/ui/pagina_configuracoes.dart';
import 'package:app_car/ui/pagina_cadastro.dart';
import 'package:app_car/videocamp.dart';
import 'package:app_car/widgets/botoes_rodape.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:app_car/auth_service.dart';
import 'package:app_car/widgets/mqtt_json.dart';
import 'dart:async';
import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
    'resource://drawable/res_notification_app_icon',
    [
      NotificationChannel(
        channelKey: 'alarm-channel',
        channelName: 'Alarm Notifications',
        defaultColor: const Color.fromARGB(255, 100, 100, 100),
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        channelDescription: 'Local onde mostra se o alarme está ligado',
      ),
      NotificationChannel(
        channelKey: 'sensor-channel',
        channelName: 'Presença detectada!',
        defaultColor: const Color.fromARGB(255, 100, 100, 100),
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        channelDescription: 'Local onde mostra se o sensor detecta alguem',
      ),
      NotificationChannel(
        channelKey: 'impact-channel',
        channelName: 'Impact Notifications',
        defaultColor: const Color.fromARGB(255, 100, 100, 100),
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        channelDescription: 'Mostra se o acelerometro detecta mudanças bruscas',
      )
    ],
  );
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterPage(),
    );
  }
}
