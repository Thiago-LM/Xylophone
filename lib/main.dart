import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xylophone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final player = AudioCache();
  final colors = <Color>[
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return ListView.builder(
              itemCount: colors.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: constraints.maxHeight / 7,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: colors[index],
                    ),
                    onPressed: () => player.play(
                      'note${index + 1}.wav',
                      mode: PlayerMode.LOW_LATENCY,
                      stayAwake: false,
                    ),
                    child: Text(''),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
