// import 'package:app_car/ui/pagina_configuracoes.dart';
import 'package:app_car/ui/pagina_cadastro.dart';
import 'package:app_car/widgets/botoes_rodape.dart';
import 'package:flutter/material.dart';
import 'package:app_car/auth_service.dart';

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
                SizedBox(
                  width: (MediaQuery.of(context).size.width) * 0.80,
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        hintText: 'Email', prefixIcon: Icon(Icons.mail)),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Senha', prefixIcon: Icon(Icons.lock)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
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
                          builder: (context) => BotaoRodape(),
                        ),
                      );
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AutenticaUsuario extends StatelessWidget {
  final String _label;
  final Icon _icone;
  final bool _esconde;

  AutenticaUsuario(this._label, this._icone, this._esconde);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _esconde,
      decoration: InputDecoration(
        labelText: _label,
        prefixIcon: _icone,
      ),
    );
  }
}
