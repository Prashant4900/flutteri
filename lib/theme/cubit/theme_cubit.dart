import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeInitial(ThemeMode.system));

  ThemeMode themeMode = ThemeMode.system;

  Future<void> changeTheme(ThemeMode themeMode) async {
    emit(ThemeChanged(themeMode));
  }

  Future<void> getTheme() async {
    emit(ThemeChanged(themeMode));
  }
}
