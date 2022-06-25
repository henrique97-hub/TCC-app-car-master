import 'package:flutter/material.dart';

class FooterNavigation extends StatefulWidget {
  const FooterNavigation({ Key? key }) : super(key: key);

  @override
  State<FooterNavigation> createState() => _FooterNavigationState();
}

class _FooterNavigationState extends State<FooterNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0X7A7A7A),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,

        
        items:  const [
          BottomNavigationBarItem(
              icon: Icon(Icons.help, color: Colors.white,),
              label: 'Ajuda',
              backgroundColor: Colors.grey,
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shield),
              label: 'Termos',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Localização',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Usuário',
              backgroundColor: Colors.transparent,
              )
        ],
      ),
      floatingActionButton:Container(
        height: 70,
        width: 70,
        padding: const EdgeInsets.all(1.0),
        child: FittedBox(
          child: FloatingActionButton(
          backgroundColor: Colors.grey,
          child: Icon(Icons.home), onPressed: () {}
          ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    
  }
}