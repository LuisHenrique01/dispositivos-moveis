import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Questao01());
  }
}

Widget buildContainer(String text, Color color) {
  return Container(
    width: 100,
    height: 100,
    color: color,
    child: Text(text),
  );
}

class Questao01 extends StatelessWidget {
  const Questao01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            buildContainer('Card 01', Colors.blueGrey),
            buildContainer('Card 02', Colors.red),
            buildContainer('Card 3', Colors.yellowAccent),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Questao02()));
        },
        child: const Text('Questão 02'),
      ),
    );
  }
}

class Questao02 extends StatelessWidget {
  const Questao02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildContainer('', Colors.red),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildContainer('', Colors.yellow),
                  buildContainer('', Colors.black),
                ],
              ),
              buildContainer('', Colors.purple)
            ]),
      ),
    );
  }
}
