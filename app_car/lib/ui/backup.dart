// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:app_car/ui/camera_externa.dart';
// import 'package:app_car/ui/camera_interna.dart';
// import 'package:app_car/ui/pagina_login.dart';
// import 'package:app_car/widgets/botao_acesso_camera.dart';
// import 'package:app_car/widgets/botao_alerta_sensores.dart';
// import 'package:app_car/widgets/bottomNavigation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class HomePageT extends StatefulWidget {


//   @override
//   State<HomePageT> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePageT> {
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData tema = ThemeData(brightness: Brightness.dark);

//     return Scaffold(
//         backgroundColor: tema.backgroundColor,
//         appBar: AppBar(
//           title: Center(
//             child: Text("Configurações"),
//           ),
//           leading: IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {
//             },
//           ),
//           backgroundColor: Colors.black,
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               margin: const EdgeInsets.only(top: 5),
//               alignment: Alignment.topLeft,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 child: const Padding(
//                   padding: EdgeInsets.all(10.0),
//                   child: Text(
//                     'Selecionar veículos',
//                     textAlign: TextAlign.right,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.black87,
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//             Row(
//               children: [
//                 Expanded(
//                   child: SizedBox(
//                     child: const Image(
//                       image: AssetImage('images/carApp.png'),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 5),
//             Container(
//               alignment: Alignment.bottomLeft,
//               child: Text("Atualizado em 25/06/2022 ás 16:55",style: TextStyle(color: Colors.white),),
//             ),
//             SizedBox(height: 20),
//             Card(
//               color: Colors.grey[800],
//               child: Expanded(
//                 child: Row(
//                   // ignore: prefer_const_literals_to_create_immutables
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(
//                         Icons.battery_charging_full_rounded,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Text("Saúde da bateria externa 98% ", style: TextStyle(color: Colors.white),),
//                   ],
//                 ),
//               ),
//             ),
//             Card(
//               color: Colors.grey[600],
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   BotaoAlerta(
//                     Icon(Icons.campaign, color: Colors.white),
//                   ),
//                   BotaoAlerta(
//                     Icon(Icons.phone, color: Colors.white),
//                   ),
//                   BotaoAlerta(
//                     Icon(Icons.album, color: Colors.white),
//                   ),
//                   BotaoAlerta(
//                     Icon(Icons.map, color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 BotaoCamera(
//                   'Acompanhe o que acontece dentro do seu veículo',
//                   'Câmeras internas',
//                   Icon(Icons.camera_alt),
//                   InternalCameras(),
//                 ),
//                 BotaoCamera(
//                   'Acompanhe o que acontece fora do seu veículo',
//                     'Câmeras externas',
//                     Icon(Icons.camera_outdoor),
//                     ExternalCameras())
//               ],
//             ),
//           ],
//         ),
//         bottomNavigationBar: const BottomNavigation());
//   }
// }




