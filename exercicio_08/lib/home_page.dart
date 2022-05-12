
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercícios')),
      body: Column(
        children: [
          simpleCard('1', 'Exercício 01', () => null),
          simpleCard('2', 'Exercício 02', () => null),
          simpleCard('3', 'Exercício 03', () => null),
          simpleCard('4', 'Exercício 04', () => null),
          simpleCard('5', 'Exercício 05', () => null),
          simpleCard('6', 'Exercício 06', () => null),
          simpleCard('7', 'Exercício 07', () => null),
      ]),
    );
  }
  
  Card simpleCard(String key, String title, Function()? onTap) {
    return Card(
      key: ValueKey(key),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(title.toUpperCase()),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: onTap,
      ),
    );
  }

}