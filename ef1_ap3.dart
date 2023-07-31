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

enum GameState {
  initial,
  correct,
  incorrect,
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

  int victories = 0;
  int defeats = 0;

  GameState _gameState = GameState.initial;

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
      _gameState = GameState.initial;
    });
  }

  void _checkAnswer(Color buttonColor) {
    if (buttonColor == corCerta) {
      setState(() {
        victories++;
        _gameState = GameState.correct;
      });
    } else {
      setState(() {
        defeats++;
        _gameState = GameState.incorrect;
      });
    }
  }

  Widget _buildButton(String buttonText, Color buttonColor) {
    return ElevatedButton(
      onPressed: () {
        if (_gameState == GameState.initial) {
          _checkAnswer(buttonColor);
        }
      },
      style: ElevatedButton.styleFrom(primary: buttonColor),
      child: Text(buttonText),
    );
  }

  Widget _buildMessage() {
    String message;
    switch (_gameState) {
      case GameState.initial:
        message = 'Clique em um botão para começar';
        break;
      case GameState.correct:
        message = 'Parabéns, você acertou!';
        break;
      case GameState.incorrect:
        message = 'Que pena, tente novamente.';
        break;
    }
    return Text(message);
  }

  Widget _buildRestartButton() {
    return ElevatedButton(
      onPressed: () {
        _shuffleButtons();
      },
      child: Text('Reiniciar'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildMessage(),
        _buildButton('Botão 1', buttonColor1),
        _buildButton('Botão 2', buttonColor2),
        _buildButton('Botão 3', buttonColor3),
        _buildRestartButton(),
        Text('Vitórias: $victories'),
        Text('Derrotas: $defeats'),
      ],
    );
  }
}
