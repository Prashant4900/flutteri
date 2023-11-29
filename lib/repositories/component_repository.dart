import 'package:flutter/services.dart';
import 'package:flutteri/models/component_model.dart';

class ComponentRepository {
  Future<ComponentModel> loadComponent() async {
    try {
      final response = await rootBundle.loadString('assets/db/components.json');
      final components = ComponentModel.fromJson(response);
      return components;
    } catch (e) {
      throw Exception(e);
    }
  }
}
