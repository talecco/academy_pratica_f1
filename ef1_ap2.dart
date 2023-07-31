import 'dart:math';
import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Color corCerta = Colors.green;
  Color corErrada = Colors.red;

  Color buttonColor1 = Colors.blue;
  Color buttonColor2 = Colors.blue;
  Color buttonColor3 = Colors.blue;

  void _shuffleButtons() {
    setState(() {
      final random = Random();
      final correctButton = random.nextInt(3) + 1;
      if (correctButton == 1) {
        buttonColor1 = corCerta;
        buttonColor2 = corErrada;
        buttonColor3 = corErrada;
      } else if (correctButton == 2) {
        buttonColor1 = corErrada;
        buttonColor2 = corCerta;
        buttonColor3 = corErrada;
      } else {
        buttonColor1 = corErrada;
        buttonColor2 = corErrada;
        buttonColor3 = corCerta;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            _shuffleButtons();
          },
          style: ElevatedButton.styleFrom(primary: buttonColor1),
          child: Text('Botão 1'),
        ),
        ElevatedButton(
          onPressed: () {
            _shuffleButtons();
          },
          style: ElevatedButton.styleFrom(primary: buttonColor2),
          child: Text('Botão 2'),
        ),
        ElevatedButton(
          onPressed: () {
            _shuffleButtons();
          },
          style: ElevatedButton.styleFrom(primary: buttonColor3),
          child: Text('Botão 3'),
        ),
      ],
    );
  }
}
