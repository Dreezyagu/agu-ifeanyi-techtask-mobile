// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RecipesModel {
  final String title;
  final List<String> ingredients;

  RecipesModel(this.title, this.ingredients);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'ingredients': ingredients,
    };
  }

  factory RecipesModel.fromMap(Map<String, dynamic> map) {
    return RecipesModel(
      map['title'] as String,
      List<String>.from((map['ingredients'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipesModel.fromJson(String source) =>
      RecipesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
