import 'package:app_car/ui/login_page.dart';
import 'package:app_car/ui/template_color.dart';
import 'package:app_car/ui/teste_widget.dart';
import 'package:app_car/widgets/bottomNavigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_car/auth_service.dart';
import 'package:app_car/ui/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData(
    brightness: Brightness.dark
    );

    final LinearGradient gradiente = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.grey.shade900,
        Colors.grey,
      ],
    );
    
    return Scaffold(
      backgroundColor: tema.backgroundColor ,
      appBar: AppBar(
        title: const Center(
          child: Text('Crie a sua conta'),
        ),
      backgroundColor: Colors.black,
      ),

      
      extendBody: true,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: _userController,
                    obscureText: true,
                    decoration: const InputDecoration(
                    hintText: 'Usuário',
                    ),
                  ),
                ),
              const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: _emailController,
                    obscureText: true,
                    decoration: const InputDecoration(
                    hintText: 'email',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                    hintText: 'Senha',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.lock_open),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async{
                    final message = await AuthService().registration(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    if (message!.contains('Success')){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                 );
                },
                  child: const Text('Criar Conta'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey[900],
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                  )
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage())
                    );
                  },
                  child: const Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey[900],
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                  )
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
      // bottomNavigationBar: FooterNavigation(),
    );
  }
}
