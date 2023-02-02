part of 'get_recipe_cubit.dart';

@immutable
abstract class GetRecipeState {}

class GetRecipeInitial extends GetRecipeState {}

class GetRecipeLoading extends GetRecipeState {}

class GetRecipeLoaded extends GetRecipeState {
  final List<RecipesModel> recipes;

  GetRecipeLoaded(this.recipes);
}

class GetRecipeError extends GetRecipeState {
  final String error;

  GetRecipeError(this.error);
}
