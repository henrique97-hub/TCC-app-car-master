// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ConfigAjuda extends StatefulWidget {
  const ConfigAjuda({Key? key}) : super(key: key);

  @override
  State<ConfigAjuda> createState() => _ConfigAjudaState();
}

class _ConfigAjudaState extends State<ConfigAjuda> {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData(brightness: Brightness.dark);
    return Scaffold(
      backgroundColor: tema.backgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text('Ajuda'),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              'Home: Botão que direciona à tela inicial',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.campaign,
              color: Colors.white,
            ),
            title: Text(
              'Alarme: Ao clicar nesse botão é possível habilitar o sensor de alarme, ou desabilita-lo.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.phone,
              color: Colors.white,
            ),
            title: Text(
              'Ligação: Através desse botão o usuário é direcionado para o telefone de seu dispositivo.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.album,
              color: Colors.white,
            ),
            title: Text(
              'Gravação de tela: Ao acionar esse botão, é possível iniciar ou finalizar a gravação de tela do aplicativo',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.double_arrow,
              color: Colors.white,
            ),
            title: Text(
              'Botão do Sensor de movimento: Indica que houve movimento no veículo.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.sensors,
              color: Colors.white,
            ),
            title: Text(
              'Botão do sensor de presença: Indica que há presença dentro do veículo.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.map,
              color: Colors.white,
            ),
            title: Text(
              'Botão de GPS: Permite verificar a localização do veículo.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            title: Text(
              'Botão de Câmera Interna: Permite visualizar o interior do veículo.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.camera_outdoor,
              color: Colors.white,
            ),
            title: Text(
              'Botão de Câmera Externa: Permite visualizar a parte externa do veículo.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            title: Text(
              'Botão de Sair: Botão que desconecta o usuário de sua conta.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            title: Text(
              'Botão de Notificação: Botão para ativar ou desativar as notificações que o aplicativo envia ao usuário. ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.shield,
              color: Colors.white,
            ),
            title: Text(
              'Termos de Uso: Termos de uso do usuário.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
