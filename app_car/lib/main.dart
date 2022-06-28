
import 'package:app_car/ui/home_page.dart';
import 'package:app_car/ui/login_page.dart';
import 'package:app_car/ui/register_page.dart';
import 'package:app_car/ui/template_color.dart';
import 'package:app_car/ui/teste.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
