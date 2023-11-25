import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutteri/routes/routes.dart';
import 'package:flutteri/theme/cubit/theme_cubit.dart';
import 'package:flutteri/theme/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit()..getTheme(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutteri',
            debugShowCheckedModeBanner: false,
            theme: ThemeManager.lightTheme,
            darkTheme: ThemeManager.darkTheme,
            themeMode: state.themeMode,
            onGenerateRoute: RouteManager.generateRoute,
            initialRoute: MyRoutes.home,
          );
        },
      ),
    );
  }
}
