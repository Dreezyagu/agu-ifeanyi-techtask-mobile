import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/cubits/get_ingredients/get_ingredients_cubit.dart';

void main() {
  group("Get ingredients test", () {
    GetIngredientsCubit? getIngredientsCubit;
    setUp(() {
      getIngredientsCubit = GetIngredientsCubit();
    });

    blocTest<GetIngredientsCubit, GetIngredientsState>(
      "Get ingredients successful test",
      build: () => getIngredientsCubit!,
      act: (cubit) => cubit.getIngredients(),
      expect: () => [GetIngredientsLoading(), GetIngredientsLoaded([])],
    );
  });
}
