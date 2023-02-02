part of 'get_ingredients_cubit.dart';

@immutable
abstract class GetIngredientsState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetIngredientsInitial extends GetIngredientsState {}

class GetIngredientsLoading extends GetIngredientsState {}

class GetIngredientsLoaded extends GetIngredientsState {
  final List<IngredientsModel> ingredients;

  GetIngredientsLoaded(this.ingredients);
}

class GetIngredientsError extends GetIngredientsState {
  final String error;

  GetIngredientsError(this.error);
}
