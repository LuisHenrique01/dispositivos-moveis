import 'package:flutter/material.dart';
import 'package:fipe_app/configs/routers.dart';
import 'package:fipe_app/configs/app_styles.dart';

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
              titleTextStyle: AppStyles.titleStyle,
              iconTheme: IconThemeData(color: Colors.black))),
      initialRoute: '/',
      routes: Routers.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
