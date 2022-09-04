import 'package:app_car/ui/pagina_configuracoes.dart';
import 'package:app_car/ui/pagina_cadastro.dart';
import 'package:app_car/widgets/bottomNavigation.dart';
import 'package:app_car/widgets/botoes_rodape.dart';
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
    final ThemeData tema = ThemeData(brightness: Brightness.dark);

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
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image(
                    image: AssetImage('assets/images/login_image.png'),
                  ),
                  AutenticaUsuario('Usuário', Icon(Icons.person)),
                  AutenticaUsuario('Senha', Icon(Icons.lock)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:[
                      TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ));
                      },
                      child: const Text(
                        'Esqueci a minha senha', 
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.underline
                        ),
                      ),
                    ),
                    ], 
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => BotaoRodape(),
                        ),
                      );
                    },
                    child: Text('Acessar'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey[900],
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavigation(),
        );
  }
}

class AutenticaUsuario extends StatelessWidget {
  final String _label;
  final Icon _icone;

  AutenticaUsuario( this._label, this._icone);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: _label,
        prefixIcon: _icone,
      ),
    );
  }
}
