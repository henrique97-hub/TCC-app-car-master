import 'package:app_car/ui/pagina_login.dart';
import 'package:app_car/ui/template_color.dart';
import 'package:app_car/widgets/botoes_rodape.dart';
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
    final ThemeData tema = ThemeData(brightness: Brightness.dark);

    return Scaffold(
      backgroundColor: tema.backgroundColor,
      appBar: AppBar(
        title: const Center(
          child: Text('Crie a sua conta'),
        ),
        backgroundColor: Colors.black,
      ),
      extendBody: true,
      body: SingleChildScrollView(
        child: CadastroUsuario(),
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}

class CadastroUsuario extends StatelessWidget {
  const CadastroUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CamposCadastro(
              'Usuário',
              Icon(Icons.person),
            ),
            CamposCadastro(
              'Email',
              Icon(Icons.email),
            ),
            CamposCadastro(
              'Senha',
              Icon(Icons.lock),
            ),
            CamposCadastro(
              'Digite novamente sua Senha',
              Icon(Icons.lock_open),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Cadastrar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey[900],
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: const Text('Entrar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey[900],
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CamposCadastro extends StatelessWidget {
  final String label;
  final Icon icone;

  const CamposCadastro(this.label, this.icone);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icone,
      ),
    );
  }
}
