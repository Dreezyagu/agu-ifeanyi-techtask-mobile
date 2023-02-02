import 'package:get_it/get_it.dart';
import 'package:tech_task/cubits/get_ingredients/get_ingredients_cubit.dart';
import 'package:tech_task/cubits/get_recipes/get_recipe_cubit.dart';

final GetIt injector = GetIt.instance;

void init() {
  injector.registerLazySingleton(() => GetIngredientsCubit());
  injector.registerLazySingleton(() => GetRecipeCubit());

}
