import 'package:flutter/material.dart';
import 'package:flutteri/views/components_page.dart';
import 'package:flutteri/views/error_page.dart';
import 'package:flutteri/views/home_page.dart';

part 'route_name.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.home:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case MyRoutes.components:
        return MaterialPageRoute(builder: (_) => const MyComponentsPage());
      default:
        return MaterialPageRoute(
          builder: (_) => MyErrorPage(routeName: settings.name!),
        );
    }
  }
}
