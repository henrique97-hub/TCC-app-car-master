import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class VideoCam extends StatefulWidget {
  const VideoCam({Key? key}) : super(key: key);

  @override
  State<VideoCam> createState() => _VideoCamState();
}

class _VideoCamState extends State<VideoCam> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isRunning = true;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Mjpeg(
                isLive: isRunning,
                error: (context, error, stack) {
                  print(error);
                  print(stack);
                  return Text(error.toString(),
                      style: TextStyle(color: Colors.red));
                },
                stream: 'http://192.168.102.84:81/stream',
                // stream: 'http://192.168.0.112:81/stream',
                timeout: const Duration(seconds: 60),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                  isRunning = !isRunning;
                },
                child: Text('Toggle'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
