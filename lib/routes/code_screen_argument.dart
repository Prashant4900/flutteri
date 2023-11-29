import 'package:flutteri/models/type_model.dart';

class CodeScreenArgument {
  CodeScreenArgument({
    required this.categoryName,
    required this.components,
  });

  final List<TypeModel> components;
  final String categoryName;
}
