import 'package:flutter/material.dart';
import 'package:exercicio_08/configs/routers.dart';


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
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: const Color(0xFF25e4bc),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF3f8978),
              iconTheme: IconThemeData(color: Colors.black))),
      initialRoute: Routers.homePage,
      onGenerateRoute: RoutersGenerator.getRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}