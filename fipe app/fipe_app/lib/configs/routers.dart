import 'package:fipe_app/models/arguments.dart';
import 'package:fipe_app/pages/info_page.dart';
import 'package:fipe_app/pages/models_page.dart';
import 'package:flutter/material.dart';

import 'package:fipe_app/pages/home_page.dart';
import 'package:fipe_app/pages/brands_page.dart';

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
      case Routers.brandsPage:
        final args = routeSettings.arguments as Arguments;
        return MaterialPageRoute(builder: (_) => BrandsPage(data: args.data));
      case Routers.modelsPage:
        final args = routeSettings.arguments as Arguments;
        return MaterialPageRoute(builder: (_) => ModelsPage(data: args.data));
      case Routers.infosPage:
        final args = routeSettings.arguments as Arguments;
        return MaterialPageRoute(builder: (_) => InfoPage(data: args.data));
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
