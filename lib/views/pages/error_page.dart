import 'package:flutter/material.dart';

class MyErrorPage extends StatelessWidget {
  const MyErrorPage({required this.routeName, super.key});

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for $routeName'),
      ),
    );
  }
}
