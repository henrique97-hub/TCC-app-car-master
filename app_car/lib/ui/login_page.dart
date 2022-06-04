

import 'package:app_car/ui/home_page.dart';
import 'package:app_car/widgets/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static final _auth = LocalAuthentication();
  
  static Future<bool> hasBiometrics() async {
    return await _auth.canCheckBiometrics;
  }

  static Future<bool> authenticate() async {
    final isAvaliable = await hasBiometrics();
    if(!isAvaliable) return false;
    return await _auth.authenticateWithBiometrics(
      localizedReason: "Use a biometria para prosseguir",
      useErrorDialogs: true,
      stickyAuth: true,
      );
  }



  @override
  State<LoginPage> createState() => _LoginPageState();


}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Autenticação'),
          ),
          backgroundColor: Colors.black,
        ),
      backgroundColor: Colors.grey,
      extendBody: true,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 200,
                  child: Image.asset('assets/images/login_image.png')),
                Container(
                  height: 50,
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (text) {
                    email = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email'
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (text) {
                    senha = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha'
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    if (email == 'app@car.com.br' && senha == '123'){
                      // final isAuthenticated = await LoginPage.authenticate();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage())
                      );
                    }
                    else {
                      print('Senha invalida!');
                    }
                  },
                   child: Text('Acessar'))
                ],
            ),
          ),
        ),
      ),
        bottomNavigationBar: const BottomNavigation(),
    );
  }
}
