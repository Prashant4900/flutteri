import 'package:flutter/material.dart';
import 'package:flutteri/models/component_model.dart';
import 'package:flutteri/repositories/component_repository.dart';

class ComponentProvider with ChangeNotifier {
  final _componentRepository = ComponentRepository();

  List<Datum> _component = [];

  List<Datum> get components => _component;

  Future<void> loadData() async {
    final result = await _componentRepository.loadComponent();
    _component = result.data!;
    notifyListeners();
  }
}
