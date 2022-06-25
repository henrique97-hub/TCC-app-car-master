import 'package:app_car/ui/login_page.dart';
import 'package:app_car/ui/template_color.dart';
import 'package:app_car/ui/teste_widget.dart';
import 'package:app_car/widgets/bottomNavigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

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
                TextField(
                  onChanged: (text) {
                    print(text);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Usuário',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.lock_open),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  
                  onPressed: () {},
                  child: const Text('Cadastrar'),
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
