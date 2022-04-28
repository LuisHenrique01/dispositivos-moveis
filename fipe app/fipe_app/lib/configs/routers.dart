import 'package:fipe_app/pages/home_page.dart';
import 'package:flutter/widgets.dart';

class Routers {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => HomePage()
  };
}
