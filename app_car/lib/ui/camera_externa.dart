// // ignore_for_file: prefer_const_constructors

// import 'package:app_car/ui/pagina_configuracoes.dart';
// import 'package:app_car/ui/camera_interna.dart';
// import 'package:app_car/videocamp.dart';
// import 'package:app_car/widgets/botao_acesso_camera.dart';
// import 'package:app_car/widgets/botao_alerta_sensores.dart';
// import 'package:app_car/widgets/botoes_rodape.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mjpeg/flutter_mjpeg.dart';
// // import do mqtt_client
// import 'package:mqtt_client/mqtt_client.dart';

// class ExternalCameras extends StatefulWidget {
//   const ExternalCameras({Key? key}) : super(key: key);

//   @override
//   State<ExternalCameras> createState() => _ExternalCamerasState();
// }

// class _ExternalCamerasState extends State<ExternalCameras> {
//   @override
//   Widget build(BuildContext context) {
//     var isRunning = true;
//     final ThemeData tema = ThemeData(brightness: Brightness.dark);


//     return Scaffold(
//       backgroundColor: tema.backgroundColor,
//       appBar: AppBar(
//         title: Center(
//           child: Text("Câmeras Externas"),
//         ),
//         backgroundColor: Colors.black,
//         leading: IconButton(
//           icon: Icon(Icons.keyboard_return_rounded),
//           onPressed: () {
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                 builder: (context) => BotaoRodape(),
//               ),
//             );
//           },
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 5),
//             child: Mjpeg(
//               isLive: isRunning,
//               error: (context, error, stack) {
//                 print(error);
//                 print(stack);
//                 return Text(error.toString(),
//                     style: TextStyle(color: Colors.red));
//               },
//               stream: 'http://192.168.48.84:81/stream',
//               // stream: 'http://192.168.0.112:81/stream',
//               timeout: const Duration(seconds: 60),
//             ),
//           ),
//           SizedBox(height: 15),
//           Container(
//             alignment: Alignment.bottomLeft,
//             child: Text(
//               "Atualizado em 25/06/2022 ás 16:55",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           SizedBox(height: 60),
//           Card(
//             color: Colors.grey[800],
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Row(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Icon(
//                           Icons.battery_charging_full_rounded,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text("Saúde da bateria externa 98% ",
//                           style: TextStyle(color: Colors.white)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Card(
//             color: Colors.grey[600],
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               // ignore: prefer_const_literals_to_create_immutables
//               children: [
//                 BotaoAlerta(
//                     Icon(Icons.campaign, color: Colors.white), 'campainha'),
//                 BotaoAlerta(Icon(Icons.phone, color: Colors.white), 'telefone'),
//                 BotaoAlerta(Icon(Icons.album, color: Colors.white), 'gravação'),
//                 BotaoAlerta(Icon(Icons.map, color: Colors.white), 'GPS'),
//               ],
//             ),
//           ),
//           SizedBox(height: 60),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: const [
//               BotaoCamera(
//                 'Acompanhe o que acontece dentro do seu veículo',
//                 'Câmeras internas',
//                 Icon(Icons.camera_alt),
//                 InternalCameras(),
//               ),
//               BotaoCamera(
//                 'Acompanhe o que acontece fora do seu veículo',
//                 'Câmeras externas',
//                 Icon(Icons.camera_outdoor),
//                 ExternalCameras(),
//               )
//             ],
//           ),
//         ],
//       ),
//       // bottomNavigationBar:  BottomNavigation(),
//     );
//   }
// }
    return Scaffold(
      backgroundColor: tema.backgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text("Câmeras Externas"),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.keyboard_return_rounded),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => BotaoRodape(),
              ),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Mjpeg(
              isLive: isRunning,
              error: (context, error, stack) {
                print(error);
                print(stack);
                return Text(error.toString(),
                    style: TextStyle(color: Colors.red));
              },
              stream: 'http://192.168.164.84:81/stream',
              // stream: 'http://192.168.0.112:81/stream',
              timeout: const Duration(seconds: 60),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(height: 60),
          Card(
            color: Colors.grey[800],
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.update,
                          color: Colors.white,
                        ),
                      ),
                      Text("Atualizado em 25/06/2022 ás 16:55",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: Colors.grey[600],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                BotaoAlerta(
                    Icon(Icons.campaign, color: Colors.white), 'alarme'),
                BotaoAlerta(Icon(Icons.phone, color: Colors.white), 'telefone'),
                BotaoAlerta(Icon(Icons.album, color: Colors.white), 'gravação'),
                BotaoAlerta(Icon(Icons.map, color: Colors.white), 'GPS'),
              ],
            ),
          ),
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              BotaoCamera(
                'Acompanhe o que acontece dentro do seu veículo',
                'Câmeras internas',
                Icon(Icons.camera_alt),
                InternalCameras(),
              ),
              BotaoCamera(
                'Acompanhe o que acontece fora do seu veículo',
                'Câmeras externas',
                Icon(Icons.camera_outdoor),
                ExternalCameras(),
              )
            ],
          ),
        ],
      ),
      // bottomNavigationBar:  BottomNavigation(),
    );
  }
}
