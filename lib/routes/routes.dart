import 'package:flutter/material.dart';
import 'package:flutteri/routes/code_screen_argument.dart';
import 'package:flutteri/views/code_page.dart';
import 'package:flutteri/views/components_page.dart';
import 'package:flutteri/views/error_page.dart';
import 'package:flutteri/views/home_page.dart';
import 'package:go_router/go_router.dart';

enum RoutePath {
  home(path: '/'),
  components(path: 'components'),
  code(path: 'code');

  const RoutePath({required this.path});

  final String path;
}

class RouteManager {
  static final goRoute = GoRouter(
    initialLocation: RoutePath.home.path,
    navigatorKey: GlobalKey<NavigatorState>(),
    routes: [
      GoRoute(
        name: RoutePath.home.name,
        path: RoutePath.home.path,
        pageBuilder: (context, state) =>
            const MaterialPage(child: MyHomePage()),
        routes: [
          GoRoute(
            name: RoutePath.components.name,
            path: RoutePath.components.path,
            builder: (context, state) => const MyComponentsPage(),
            routes: [
              GoRoute(
                name: RoutePath.code.name,
                path: ':slug',
                builder: (context, state) => MyCodePage(
                  args: state.extra! as CodeScreenArgument,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => MyErrorPage(routeName: state.path!),
  );
}
