import 'package:flutter/material.dart';

void main() {
  runApp(const PoorApp());
}

class PoorApp extends StatefulWidget {
  const PoorApp({Key? key}) : super(key: key);

  @override
  State<PoorApp> createState() => PoorAppState();
}

class PoorAppState extends State<PoorApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeApp());
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[400],
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: const Text("I'm poor"),
      ),
      body: const Center(
        child: Image(
            image: AssetImage('assets/images/coal.png'),
            height: 150,
            width: 150),
      ),
    );
  }
}
