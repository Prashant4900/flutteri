import 'package:flutteri/layout/switch/switch_case_widget.dart';

class CategoryModel {
  CategoryModel({
    this.widgetSwitchCase,
    this.id,
    this.name,
    this.icon,
  });

  final int? id;
  final String? name;
  final String? icon;
  final WidgetSwitchCase? widgetSwitchCase;
}

extension Slug on String {
  String get toSlug => replaceAll(' ', '-').toLowerCase();
}
