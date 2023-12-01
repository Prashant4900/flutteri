import 'package:flutter/material.dart';
import 'package:flutteri/routes/component_page_args.dart';
import 'package:flutteri/views/pages/category_page.dart';
import 'package:flutteri/views/pages/component_page.dart';
import 'package:flutteri/views/pages/error_page.dart';
import 'package:flutteri/views/pages/home_page.dart';
import 'package:go_router/go_router.dart';

enum RoutePath {
  home(path: '/'),
  categories(path: 'categories'),
  components(path: 'components');

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
            name: RoutePath.categories.name,
            path: RoutePath.categories.path,
            builder: (context, state) => const MyCategoryPage(),
            routes: [
              GoRoute(
                name: RoutePath.components.name,
                path: ':slug',
                builder: (context, state) => MyComponentPage(
                  args: state.extra! as ComponentPageArgs,
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
