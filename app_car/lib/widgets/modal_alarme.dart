// import 'dart:convert';

// import 'package:app_car/widgets/globals.dart' as globals;
// import 'package:app_car/widgets/notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:mqtt_client/mqtt_client.dart' as mqtt;

// abrirDialogInfo(BuildContext context, String sensor, bool estado) {
//   mqtt.MqttClient? client;
//   final String topic;

//   if (estado) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.grey,
//           title: Text('Deseja ativar esse ${sensor}?'),
//           content: Text(
//               'Esse botão permite que o usuário ative o ${sensor} em tempo real.'),
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('Cencelar'),
//                   style: ElevatedButton.styleFrom(primary: Colors.red[100]),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     if (estado) {
//                       createAlarmNotification();
//                     }
//                   },
//                   child: Text('Ativar'),
//                   style: ElevatedButton.styleFrom(primary: Colors.green[100]),
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
