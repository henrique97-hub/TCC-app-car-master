// ignore_for_file: prefer_const_constructors

import 'package:app_car/ui/acesso_gps.dart';
import 'package:app_car/ui/camera_externa.dart';
import 'package:app_car/ui/pagina_configuracoes.dart';
import 'package:app_car/ui/camera_interna.dart';
import 'package:flutter/material.dart';

class BotaoRodape extends StatefulWidget {
  @override
  BotaoRodapeState createState() => BotaoRodapeState();
}

class BotaoRodapeState extends State<BotaoRodape> {
  int indiceAtual = 0; // Variável para controlar o índice das telas

  final List<Widget> _telas = [
    HomePage(),
    ExternalCameras(),
    HomePage(),
    GpsAcesso(),
    InternalCameras(),
  ];

  void onTabTapped(int index) {
    setState(() {
      indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[indiceAtual], // alterando posição da lista
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black26,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: indiceAtual,
        onTap: onTabTapped, // Chamando o método ao clicar em uma das opções
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: 'Ajuda',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.shield),
              label: 'Termos',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Localização',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Usuário',
              backgroundColor: Colors.transparent)
        ],
      ),
    );
  }
}
