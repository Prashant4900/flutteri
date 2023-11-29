import 'dart:convert';

class TypeModel {
  TypeModel({
    this.id,
    this.title,
    this.gistId,
    this.componentsGistId,
    this.demo,
  });

  factory TypeModel.fromJson(String str) =>
      TypeModel.fromMap(json.decode(str) as Map<String, dynamic>);

  factory TypeModel.fromMap(Map<String, dynamic> json) => TypeModel(
        id: json['id'] as int,
        title: json['title'] as String,
        gistId: json['gist-id'] as String,
        componentsGistId: json['components-gist-id'] as String,
        demo: json['demo'] as String,
      );
  final int? id;
  final String? title;
  final String? gistId;
  final String? componentsGistId;
  final String? demo;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'gist-id': gistId,
        'components-gist-id': componentsGistId,
        'demo': demo,
      };
}
