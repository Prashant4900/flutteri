import 'dart:convert';

import 'package:flutteri/models/type_model.dart';

class ComponentModel {
  ComponentModel({
    this.data,
  });

  factory ComponentModel.fromJson(String str) {
    return ComponentModel.fromMap(
      json.decode(str) as Map<String, dynamic>,
    );
  }

  factory ComponentModel.fromMap(Map<String, dynamic> json) {
    return ComponentModel(
      data: List<Datum>.from(
        (json['data'] as List<dynamic>)
            .map((datum) => Datum.fromMap(datum as Map<String, dynamic>)),
      ),
    );
  }

  final List<Datum>? data;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'data': List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.icon,
    this.components,
    this.slug,
  });

  factory Datum.fromJson(String str) =>
      Datum.fromMap(json.decode(str) as Map<String, dynamic>);

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json['id'] as int,
        name: json['name'] as String,
        slug: json['slug'] as String,
        icon: json['icon'] as String,
        components: List<TypeModel>.from(
          (json['types'] as List<dynamic>).map(
            (typeModel) => TypeModel.fromMap(typeModel as Map<String, dynamic>),
          ),
        ),
      );

  final int? id;
  final String? name;
  final String? slug;
  final String? icon;
  final List<TypeModel>? components;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'slug': slug,
        'icon': icon,
        'types': List<dynamic>.from(components!.map((x) => x.toMap())),
      };
}
