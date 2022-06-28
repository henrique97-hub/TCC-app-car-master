import 'package:app_car/ui/external_cameras.dart';
import 'package:app_car/ui/home_page.dart';
import 'package:app_car/widgets/bottomNavigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternalCameras extends StatefulWidget {
  const InternalCameras({ Key? key }) : super(key: key);

  @override
  State<InternalCameras> createState() => _InternalCamerasState();
}

class _InternalCamerasState extends State<InternalCameras> {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData(brightness: Brightness.dark);

    return Scaffold(
        backgroundColor: tema.backgroundColor,
        appBar: AppBar(
          title: Center(
            child: Text("Câmeras Internas"),
          ),
          leading: IconButton(
            icon: Icon(Icons.keyboard_return_rounded),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage())
                    );
            },
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: SizedBox(
                child: Image.asset('assets/images/internal_camera.png'))),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 50),
              child: Text("Atualizado em 25/06/2022 ás 16:55"), 
              ),

            Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 60),
                color: Colors.grey[800],
                child: 
                 Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.battery_charging_full_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                        
                      ),
                      Text("       Saúde da bateria externa                                                        98% "),
                    ],
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 12),
                color: Colors.grey[600],
                child: Row(
                  children: [  
                    SizedBox(width: 50),                  
                    IconButton(
                      icon: Icon(
                        Icons.campaign,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _abrirDialog(context);
                      },
                    ),
                    SizedBox(width: 70),
                    IconButton(
                      icon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _abrirDialog(context);
                      },
                    ),
                    SizedBox(width: 70),
                    IconButton(
                      icon: Icon(
                        Icons.album,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _abrirDialog(context);
                      },
                    ),
                    SizedBox(width: 70),
                    IconButton(
                      icon: Icon(
                        Icons.map,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _abrirDialog(context);
                      },
                    ),
                  ],
                )),
           Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,  
              children: [ 
              Container(
               margin: const EdgeInsets.only(left: 1.0, right: 20.0, top: 10),
              alignment: Alignment.bottomCenter,
              height: 70 ,
              width: 150 ,
              child: Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Visualizar interior do veículo ',
                      textAlign: TextAlign.center,
                    ),
                  
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                ),
              ),
                ),
              Container(
               margin: const EdgeInsets.only(left: 1.0, right: 20.0, top: 10),
              alignment: Alignment.bottomCenter,
              height: 70 ,
              width: 150,
              child: Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ExternalCameras())
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Visualizar exterior do veículo ',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                ),
              ),
                )

              ],


            ),
              

            ),
          ],
          
        ),
        bottomNavigationBar: const BottomNavigation());
  }
      _abrirDialog(BuildContext context){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Deseja ativar esse sensor?'),
            content: Text('Esse botão permite que o usuário ative o sensor em tempo real.'),
            actions: [
              FlatButton(
                textColor: Color(0xFF6200EE),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('CANCELAR'),
              ),
              FlatButton(
                textColor: Color(0xFF6200EE),
                onPressed: () {
                  Navigator.of(context).pop();
                  print("Alarme ativado!");
                },
                child: Text('ATIVAR'),
              ),
            ],
          );
        });
    }
}
