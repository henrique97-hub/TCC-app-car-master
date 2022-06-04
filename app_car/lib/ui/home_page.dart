import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
final String assetName = 'icons/notification.svg';
final Widget svg = SvgPicture.asset(
  assetName,
  semanticsLabel: 'Acme Logo'
);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(


          title: Text("your title"),
          bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 40),
              child: Center(
                child: Container(
                  height: 20.0,
                  width: 20.0,
                  color: Colors.blue[50],
                  child: const Align(
                    alignment: FractionalOffset(0.2, 0.6),
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
              )),
        ),
        body: Container(
          child: ListView.builder(
            itemBuilder: (context, int index) {
              return Text(index.toString());
            },
            itemCount: 100,
          ),
        ));
  }
}