import 'package:app_car/ui/pagina_configuracoes.dart';
import 'package:app_car/ui/pagina_login.dart';
import 'package:app_car/widgets/botoes_rodape.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData(brightness: Brightness.dark);
    return Scaffold(
      backgroundColor: tema.backgroundColor,
      appBar: AppBar(
        title: const Center(
          child: Text("Tem certeza que deseja sair?"),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_return_rounded),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => BotaoRodape(),
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: Image(
                    image: AssetImage('assets/images/carApp.png'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 40,
                width: 140,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => BotaoRodape(),
                      ),
                    );
                  },
                  child: const Text('Permanecer'),
                ),
              ),
              SizedBox(
                height: 40,
                width: 140,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green[100]),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: const Text('Sair'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
