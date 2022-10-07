import 'dart:convert';

import 'package:app_car/ui/pagina_configuracoes.dart';
import 'package:app_car/ui/pagina_cadastro.dart';
import 'package:app_car/videocamp.dart';
import 'package:app_car/widgets/botoes_rodape.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_car/firebase_options.dart';
import 'firebase_options.dart';
import 'package:app_car/auth_service.dart';
import 'package:app_car/widgets/mqtt_json.dart';
import 'dart:async';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterPage(),
      // home: HomePage(),
      // home: VideoCam(),
    );
  }
}
