import 'package:fipe_app/models/arguments.dart';
import 'package:flutter/material.dart';

import 'package:fipe_app/pages/home_page.dart';
import 'package:fipe_app/pages/brand_page.dart';

class Routers {
  static const String homePage = '/';
  static const String brandPage = '/brand';
}

class RoutersGenerator {
  static Route<dynamic> getRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routers.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routers.brandPage:
        final args = routeSettings.arguments as Arguments;
        return MaterialPageRoute(builder: (_) => BrandPage(data: args.data));
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
