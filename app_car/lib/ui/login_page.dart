

import 'package:app_car/ui/home_page.dart';
import 'package:app_car/ui/register_page.dart';
import 'package:app_car/ui/teste_widget.dart';
import 'package:app_car/widgets/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  
  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  String usuario = '';
  String senha = '';
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
                SizedBox(height: 10),
                TextField(
                  onChanged: (text) {
                    usuario = text;
                  },
                  decoration: InputDecoration(
                    labelText: 'Usuário',
                    prefixIcon: Icon(Icons.person)
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (text) {
                    senha = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.lock),
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
                    // if (usuario == 'henrique' && senha == '123'){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage())
                      );
                    // }
                    // else {
                    //   print('Senha invalida!');
                    // }
                  },
                   child: Text('Acessar'),
                   style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey[900],
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                    
                  )
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
