import 'package:app_car/ui/external_cameras.dart';
import 'package:app_car/ui/internal_cameras.dart';
import 'package:app_car/ui/login_page.dart';
import 'package:app_car/widgets/bottomNavigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final int __opcaoSelecionada = 1;
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData(brightness: Brightness.dark);

    return Scaffold(
        backgroundColor: tema.backgroundColor,
        appBar: AppBar(
          title: Center(
            child: Text("Configurações"),
          ),
          leading: IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              print('botao clicado');
            },
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0, top: 5),
              alignment: Alignment.topLeft,
              child: ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Selecionar veículos',
                    textAlign: TextAlign.right,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black87,
                ),
              ),
            ),
            Container(
              // height: 350,
              // width: 500,
              margin: const EdgeInsets.only(top: 5),
              child: (Stack(
                children: [
                SizedBox(
                  height: 350,
                  child: const Image(image: AssetImage('images/carApp.png'))),
                ],
              )),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 25),
              child: Text("Atualizado em 25/06/2022 ás 16:55"), 
              
              ),
            Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                color: Colors.grey[800],
                child: 
                 Expanded(
                  child: Row(
                    children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Icon(
                            Icons.battery_charging_full_rounded,
                            color: Colors.white,
                        ),
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
                        _abrirDialogInfo(context);
                      },
                    ),
                    SizedBox(width: 70),
                    IconButton(
                      icon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _abrirDialogInfo(context);
                      },
                    ),
                    SizedBox(width: 70),
                    IconButton(
                      icon: Icon(
                        Icons.album,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _abrirDialogInfo(context);
                      },
                    ),
                    SizedBox(width: 70),
                    IconButton(
                      icon: Icon(
                        Icons.map,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _abrirDialogInfo(context);
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
                  onPressed: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => InternalCameras())
                    );
                  },
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
                      'Visualizar exterior do veículo',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey
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
      _abrirDialogInfo(BuildContext context){
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
