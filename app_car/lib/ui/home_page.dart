import 'package:app_car/widgets/bottomNavigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData(
    brightness: Brightness.dark
    );

    return Scaffold(
      backgroundColor: tema.backgroundColor,

      appBar: AppBar(
        title: Center(
          child: Text("Configurações"),
          ),
          leading: 
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {}, 
              ),
          backgroundColor: Colors.black,
      ),
      
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
              Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0, top: 10 ),
                  height: 70,
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(onPressed: () {},
                   child: const Padding(
                     padding: EdgeInsets.all(10.0),
                     child: Text('Selecionar veículos',
                     textAlign: TextAlign.right,
                     ),
                   ),
                   style: ElevatedButton.styleFrom(
                     primary: Colors.black87,
                   ),
                   ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 300 ),
                color: Colors.blueGrey[600],
                child: Row(children: [
                  IconButton(
                  icon: Icon(Icons.battery_full, color: Colors.white,),
                  onPressed: () {}, 
                ),
                ],)
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                color: Colors.blueGrey[600],
                child: Row(children: [
                  IconButton(
                  icon: Icon(Icons.campaign, color: Colors.white,),
                  onPressed: () {}, 
                ),
                  IconButton(
                  icon: Icon(Icons.phone, color: Colors.white,),
                  onPressed: () {}, 
                ),
                  IconButton(
                  icon: Icon(Icons.album, color: Colors.white,),
                  onPressed: () {}, 
                ),
                  IconButton(
                  icon: Icon(Icons.map, color: Colors.white,),
                  onPressed: () {}, 
                ),
                ],)
              ),
        ],
      ),

      bottomNavigationBar: const BottomNavigation()
    );
  }
}