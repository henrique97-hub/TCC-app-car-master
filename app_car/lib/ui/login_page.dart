

import 'package:app_car/ui/home_page.dart';
import 'package:app_car/ui/register_page.dart';
import 'package:app_car/ui/teste_widget.dart';
import 'package:app_car/widgets/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:app_car/auth_service.dart';
import 'package:app_car/ui/home_page.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  
  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
        final ThemeData tema = ThemeData(
    brightness: Brightness.dark
    );

    return Scaffold(
      backgroundColor: tema.backgroundColor,
        appBar: AppBar(
          title: const Center(
            child: Text('Autenticação'),
          ),
          backgroundColor: Colors.black,
        ),
      
      extendBody: true,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/images/login_image.png')),
                Container(
                  height: 50,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: _emailController,
                    obscureText: true,
                    decoration: const InputDecoration(
                    hintText: 'Email',
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                ),
                  Container(
                    height: 40,
                    alignment: Alignment.topRight,
                  child: FlatButton(onPressed: () {
                     Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => RegisterPage())
                      );
                  },
                   child: const Text('Esqueci a minha senha',
                   textAlign: TextAlign.right,
                   ),
                   ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    final message = await AuthService().login(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  if (message!.contains('Success')) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
              },
              child: const Text('Login'),
            ),
                ],
            ),
          ),
        ),
      ),
        bottomNavigationBar: const BottomNavigation()
    );
  }
}
