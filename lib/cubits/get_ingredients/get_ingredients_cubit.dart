import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tech_task/models/ingredients_model.dart';
import 'package:tech_task/services/get_ingredients_services.dart';

part 'get_ingredients_state.dart';

class GetIngredientsCubit extends Cubit<GetIngredientsState> {
  GetIngredientsCubit() : super(GetIngredientsInitial());

  Future<void> getIngredients() async {
    emit(GetIngredientsLoading());
    final response = await GetIngredientsService.fetchIngredients();
    if (response != null) {
      emit(GetIngredientsLoaded(response));
    } else {
      emit(GetIngredientsError("An error occurred"));
    }
  }
}
