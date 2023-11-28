import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutteri/app/app.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setUrlStrategy(PathUrlStrategy());
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}
