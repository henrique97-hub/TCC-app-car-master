import 'dart:js';

import 'package:app_car/ui/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_car/widgets/bottomNavigation.dart';
import 'package:app_car/ui/template_color.dart';


class HomePageTeste extends StatefulWidget {
  const HomePageTeste({Key? key}) : super(key: key);

  @override
  State<HomePageTeste> createState() => _HomePageState();
}
final String assetName = 'icons/notification.svg';
final Widget svg = SvgPicture.asset(
  assetName,
  semanticsLabel: 'Acme Logo'
);

class _HomePageState extends State<HomePageTeste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App Seguraça Automotiva"),
          bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 40),
              child: Center(
                child: Container(
                  height: 20.0,
                  width: 20.0,
                  color: Colors.transparent,
                  child: const Align(
                    alignment: FractionalOffset(0.2, 0.6),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
              )),
        ),
        body: Container(
          decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey.shade900,
                Colors.grey,
              ],
            )),
          child: Column(
            children:[ 
              Stack(
              children:[
              const Image(image: AssetImage('images/carApp.png')),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.background
                ),
                child: const Text('Open route'),
                  onPressed: () {
                  },
                ),
                ]
              ),
              ]
              )
            ),
        bottomNavigationBar: const BottomNavigation(),
        );
        
  }
}