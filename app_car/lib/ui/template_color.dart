import 'package:app_car/ui/register_page.dart';
import 'package:flutter/material.dart';
import 'package:app_car/widgets/bottomNavigation.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Crie sua conta'),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey.shade900,
                Colors.grey,
              ],
            )),
            child: const Center(
              child: RegisterPage(),
              
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigation(),
        );
  }
}
