import 'package:flutteri/layout/switch/switch_case_widget.dart';

class ComponentPageArgs {
  ComponentPageArgs({
    required this.pageState,
    required this.categoryName,
  });

  final String categoryName;
  final WidgetSwitchCase pageState;
}
