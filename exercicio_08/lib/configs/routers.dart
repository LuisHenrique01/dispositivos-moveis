import 'package:flutter/material.dart';
import 'package:exercicio_08/home_page.dart';

class Routers {
  static const String homePage = '/';
  static const String brandsPage = '/brand';
  static const String modelsPage = '/models';
  static const String infosPage = '/infos';
}

class RoutersGenerator {
  static Route<dynamic> getRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routers.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('404 - PÁGINA NÃO ENCONTRADA.'),
        ),
      ),
    );
  }
}
