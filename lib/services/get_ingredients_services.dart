import 'package:tech_task/models/ingredients_model.dart';
import 'package:tech_task/models/recipes_model.dart';
import 'package:tech_task/utils/constants.dart';
import 'package:tech_task/utils/http_helper.dart';

class GetIngredientsService {
  static Future<List<IngredientsModel>?> fetchIngredients() async {
    final response = await HttpHelper().get("$BASE_URL/ingredients");

    if (response.statusCode == 200 && response.data is List) {
      try {
        final data = response.data as List;
        final List<IngredientsModel> ingredients =
            data.map((e) => IngredientsModel.fromMap(e)).toList();
        return ingredients;
      } catch (e) {}
    }
    return null;
  }

  static Future<List<RecipesModel>?> fetchRecipe(String endpoint) async {
    final response = await HttpHelper().get("$BASE_URL/recipes$endpoint");

    if (response.statusCode == 200 && response.data is List) {
      try {
        final data = response.data as List;
        final List<RecipesModel> recipes =
            data.map((e) => RecipesModel.fromMap(e)).toList();
        return recipes;
      } catch (e) {}
    }
    return null;
  }
}
