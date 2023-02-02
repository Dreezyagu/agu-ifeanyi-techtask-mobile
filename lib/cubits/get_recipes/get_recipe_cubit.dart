import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tech_task/models/recipes_model.dart';
import 'package:tech_task/services/services.dart';

part 'get_recipe_state.dart';

class GetRecipeCubit extends Cubit<GetRecipeState> {
  GetRecipeCubit() : super(GetRecipeInitial());

  Future<void> getRecipe(String endpoint) async {
    emit(GetRecipeLoading());
    final response = await GetIngredientsService.fetchRecipe(endpoint);
    if (response != null) {
      emit(GetRecipeLoaded(response));
    } else {
      emit(GetRecipeError("An error occurred"));
    }
  }
}
