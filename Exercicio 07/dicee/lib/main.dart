import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _AppWidget();
}

class _AppWidget extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Dicee"),
        backgroundColor: Colors.red,
      ),
      body: DiceePage(),
    );
  }
}

class DiceePage extends StatefulWidget {
  const DiceePage({Key? key}) : super(key: key);

  @override
  State<DiceePage> createState() => _DiceePageState();
}

class _DiceePageState extends State<DiceePage> {
  int leftDicee = 1;
  int rightDicee = 1;

  void throwDice() {
    setState(() {
      leftDicee = Random().nextInt(6) + 1;
      rightDicee = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: [
        Expanded(
            child: TextButton(
          child: Image(image: AssetImage('images/dice$leftDicee.png')),
          onPressed: throwDice,
        )),
        Expanded(
            child: TextButton(
          child: Image(image: AssetImage('images/dice$rightDicee.png')),
          onPressed: throwDice,
        ))
      ]),
    );
  }
}
