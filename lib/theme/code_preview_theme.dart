import 'package:flutter/material.dart'
    show Color, Colors, FontStyle, FontWeight, TextStyle;

Map<String, TextStyle> androidStudioTheme = {
  'root': const TextStyle(
    color: Color(0xffa9b7c6),
    backgroundColor: Color(0xff141517),
  ),
  'number': const TextStyle(
    color: Colors.grey,
  ),
  'literal': const TextStyle(
    color: Color(0xff6897BB),
  ),
  'symbol': const TextStyle(
    color: Color(0xff6897BB),
  ),
  'bullet': const TextStyle(
    color: Color(0xff6897BB),
  ),
  'keyword': const TextStyle(
    color: Color(0xffcc7832),
  ),
  'selector-tag': const TextStyle(
    color: Color(0xffcc7832),
  ),
  'deletion': const TextStyle(
    color: Color(0xffcc7832),
  ),
  'variable': const TextStyle(
    color: Color(0xff629755),
  ),
  'template-variable': const TextStyle(
    color: Color(0xff629755),
  ),
  'link': const TextStyle(
    color: Color(0xff629755),
  ),
  'comment': const TextStyle(
    color: Color(0xff808080),
  ),
  'quote': const TextStyle(
    color: Color(0xff808080),
  ),
  'meta': const TextStyle(
    color: Color(0xffbbb529),
  ),
  'string': const TextStyle(
    color: Color(0xff6A8759),
  ),
  'attribute': const TextStyle(
    color: Color(0xff6A8759),
  ),
  'addition': const TextStyle(
    color: Color(0xff6A8759),
  ),
  'section': const TextStyle(
    color: Color(0xffffc66d),
  ),
  'title': const TextStyle(
    color: Color(0xffffc66d),
  ),
  'type': const TextStyle(
    color: Color(0xffffc66d),
  ),
  'name': const TextStyle(
    color: Color(0xffe8bf6a),
  ),
  'selector-id': const TextStyle(
    color: Color(0xffe8bf6a),
  ),
  'selector-class': const TextStyle(
    color: Color(0xffe8bf6a),
  ),
  'emphasis': const TextStyle(
    fontStyle: FontStyle.italic,
  ),
  'strong': const TextStyle(
    fontWeight: FontWeight.bold,
  ),
};

Map<String, TextStyle> darkModeTheme = {
  'root': const TextStyle(
    color: Color(0xffd4d4d4),
    backgroundColor: Color(0xff1e1e1e),
  ),
  'comment': const TextStyle(
    color: Color(0xff607a86),
    fontStyle: FontStyle.italic,
  ),
  'keyword': const TextStyle(
    color: Color(0xffd73a49),
    fontWeight: FontWeight.bold,
  ),
  'string': const TextStyle(
    color: Color(0xff6a9955),
  ),
  'number': const TextStyle(
    color: Color(0xffb5cea8),
  ),
  'variable': const TextStyle(
    color: Color(0xffe78c45),
  ),
  'type': const TextStyle(
    color: Color(0xffd4d4d4),
  ),
  'function': const TextStyle(
    color: Colors.amber,
  ),
  'punctuation': const TextStyle(
    color: Color(0xffd4d4d4),
  ),
  'symbol': const TextStyle(
    color: Color(0xffb5cea8),
  ),
  'class': const TextStyle(
    color: Color(0xffb5cea8),
  ),
  'constant': const TextStyle(
    color: Color(0xffb5cea8),
  ),
  'constructor': const TextStyle(
    color: Color(0xff4d8b5f),
  ),
  'property': const TextStyle(
    color: Color(0xffe78c45),
  ),
};
