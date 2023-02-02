import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_task/cubits/get_recipes/get_recipe_cubit.dart';
import 'package:tech_task/models/recipes_model.dart';
import 'package:tech_task/utils/di.dart';

class RecipeScreen extends StatefulWidget {
  final String endpoint;

  const RecipeScreen({Key? key, required this.endpoint}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  GetRecipeCubit getRecipeCubit = injector.get();

  @override
  void initState() {
    getRecipeCubit.getRecipe(widget.endpoint);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getRecipeCubit,
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: BlocBuilder<GetRecipeCubit, GetRecipeState>(
            builder: (context, state) {
              if (state is GetRecipeLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is GetRecipeLoaded) {
                final List<RecipesModel> recipes = state.recipes;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "List of recipes:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                        child: ListView.builder(
                      itemCount: recipes.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final RecipesModel recipe = recipes[index];
                        return Card(
                          child: ExpansionTile(
                            title: Text(
                              recipe.title,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            children: recipe.ingredients
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        e,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ))
                                .toList(),
                          ),
                        );
                      },
                    ))
                  ],
                );
              }
              return SizedBox.shrink();
            },
          ),
        )),
      ),
    );
  }
}
