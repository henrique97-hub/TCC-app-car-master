import 'package:app_car/services/auth_service.dart';
import 'package:app_car/ui/pagina_configuracoes.dart';
import 'package:app_car/ui/pagina_cadastro.dart';
import 'package:app_car/videocamp.dart';
import 'package:app_car/widgets/botoes_rodape.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterPage(),
      // home: VideoCam(),
    );
  }
}
