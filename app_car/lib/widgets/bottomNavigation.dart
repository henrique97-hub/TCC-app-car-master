

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget{
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>{
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0X7A7A7A),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,

        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: 'Ajuda',
              backgroundColor: Colors.grey
              ),
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

    );
  }
}