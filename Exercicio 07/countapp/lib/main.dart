import 'package:flutter/material.dart';

enum Operations { ADDITION, SUBTRACTION }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const CountPage(),
    );
  }
}

class CountPage extends StatefulWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int count = 0;

  int countOperator(int count, Operations operation) {
    if (operation == Operations.ADDITION) {
      count++;
    } else if (count > 0) {
      count--;
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu contador'),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purpleAccent[200],
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$count',
              style:
                  const TextStyle(fontSize: 150, fontWeight: FontWeight.w600)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton(
                  () => {
                        setState(() =>
                            {count = countOperator(count, Operations.ADDITION)})
                      },
                  Icons.add,
                  Colors.deepPurpleAccent),
              buildButton(
                  () => {
                        setState(() => {
                              count =
                                  countOperator(count, Operations.SUBTRACTION)
                            })
                      },
                  Icons.remove,
                  Colors.purple)
            ],
          ),
        ],
      )),
    );
  }

  buildButton(Function()? onPressed, IconData icon, Color color) {
    return RawMaterialButton(
        onPressed: onPressed,
        elevation: 2.5,
        fillColor: color,
        child: Icon(
          icon,
          size: 65.0,
        ),
        padding: const EdgeInsets.all(15.0));
  }
}
