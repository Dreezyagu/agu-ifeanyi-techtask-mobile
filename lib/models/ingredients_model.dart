// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class IngredientsModel {
  final String title;
  final String useBy;

  IngredientsModel(this.title, this.useBy);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'use-by': useBy,
    };
  }

  factory IngredientsModel.fromMap(Map<String, dynamic> map) {
    return IngredientsModel(
      map['title'] as String,
      map['use-by'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IngredientsModel.fromJson(String source) =>
      IngredientsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
