import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tech_task/cubits/get_recipes/get_recipe_cubit.dart';

void main() {
  group("Get recipes test", () {
    GetRecipeCubit? getRecipeCubit;
    setUp(() {
      getRecipeCubit = GetRecipeCubit();
    });

    blocTest<GetRecipeCubit, GetRecipeState>(
      "Get recipes successful test",
      build: () => getRecipeCubit!,
      act: (cubit) => cubit.getRecipe("?ingredients=Eggs,Bacon"),
      expect: () => [GetRecipeLoading(), GetRecipeLoaded([])],
    );
  });
}
