import 'package:flutter/material.dart';
import 'package:flutteri/routes/routes.dart';
import 'package:flutteri/theme/theme_manager.dart';
import 'package:flutteri/theme/theme_service.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: Consumer<ThemeService>(
        builder: (context, themeProvider, child) {
          return MaterialApp.router(
            title: 'Flutteri',
            debugShowCheckedModeBanner: false,
            theme: ThemeManager.lightTheme,
            darkTheme: ThemeManager.darkTheme,
            // themeMode: themeProvider.themeMode,
            themeMode: ThemeMode.light,
            routerConfig: RouteManager.goRoute,
          );
        },
      ),
    );
  }
}
