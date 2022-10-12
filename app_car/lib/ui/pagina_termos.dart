import 'package:flutter/material.dart';

class TermosUsuario extends StatefulWidget {
  const TermosUsuario({Key? key}) : super(key: key);

  @override
  State<TermosUsuario> createState() => _TermosUsuarioState();
}

class _TermosUsuarioState extends State<TermosUsuario> {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData(brightness: Brightness.dark);
    return Scaffold(
      backgroundColor: tema.backgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text('Termos do usuário'),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'TERMOS DE USO CAR APP',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'Elaboramos estes Termos de Serviço (que chamaremos de “Termos”) para informar você sobre as regras que regem o nosso relacionamento com você como usuário dos nossos Serviços. Antes da utilização do aplicativo CAR APP, se faz necessário a leitura dos Termos e condições de uso e política de privacidade abaixo:',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'Os usuários concordam expressamente com os termos e com as condições adiante estabelecidas ao acessar e usar os serviços de intermediação do aplicativo CAR APP. Se não concordarem com os termos de uso e condições seguintes, os usuários não terão acesso ao serviço oferecido de intermediação digital entre a câmera e os sensores com o aplicativo.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'POR FAVOR, LEIA COM ATENÇÃO ESTES TERMOS ANTES DE ACESSAR OU USAR OS SERVIÇOS.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'Para utilizar grande parte dos Serviços, você deve registrar-se e manter uma conta pessoal de usuário de Serviços (“Conta”).',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'O registro de Conta exige que o CAR APP colete determinados dados pessoais, que podem incluir seu nome, e-mail, número de telefone celular e data de nascimento. Você concorda em manter informações corretas, completas e atualizadas em sua Conta. Você é responsável por todas as atividades realizadas na sua Conta e concorda em manter sempre a segurança e confidencialidade do nome de usuário e senha da sua Conta.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'O seguinte aplicativo poderá utilizar as imagens da câmera que irá monitorar em tempo real o veículo, sendo assim, ao aceitar os termos de uso, o usuário autoriza o uso das imagens para a visualização no aplicativo.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'Não controlamos o que as pessoas ou terceiros fazem e não somos responsáveis pelas respectivas (inclusive as suas) condutas ou ações, online ou offline. Também não somos responsáveis pelos serviços e recursos oferecidos por outras pessoas ou empresas, mesmo que você os acesse por meio do nosso Serviço caso queira modificar algo por conta própria sem a instalação por meio de nossos serviços.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              'Nossa responsabilidade por qualquer ocorrência no Serviço será limitada tanto quanto permitido por lei. Não temos como prever todos os impactos possíveis que um problema com nosso Serviço possa causar. Você concorda que nós não seremos responsáveis por qualquer perda de lucro, receitas, informação ou dados, ou, ainda, por danos eventuais, especiais, indiretos, exemplares, punitivos ou acidentais decorrentes de ou relativos a estes Termos, ainda que saibamos que eles são possíveis.',
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
