import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_task/cubits/get_ingredients/get_ingredients_cubit.dart';
import 'package:tech_task/models/ingredients_model.dart';
import 'package:tech_task/screens/recipe_screen.dart';
import 'package:tech_task/utils/di.dart';

class IngredientsScreen extends StatefulWidget {
  final DateTime lunchDate;

  const IngredientsScreen({Key? key, required this.lunchDate})
      : super(key: key);

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  GetIngredientsCubit getIngredientsCubit = injector.get();

  @override
  void initState() {
    getIngredientsCubit.getIngredients();
    super.initState();
  }

  List<String> selectedIngredients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider.value(
      value: getIngredientsCubit,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: BlocBuilder<GetIngredientsCubit, GetIngredientsState>(
            builder: (context, state) {
              if (state is GetIngredientsLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is GetIngredientsLoaded) {
                final List<IngredientsModel> ingredients = state.ingredients;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "List of ingredients:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                          itemCount: ingredients.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final IngredientsModel ingredient =
                                ingredients[index];
                            final bool expired = widget.lunchDate
                                .isAfter(DateTime.parse(ingredient.useBy));
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: selectedIngredients
                                          .contains(ingredient.title)
                                      ? BorderSide(color: Colors.red)
                                      : BorderSide.none),
                              child: ListTile(
                                onTap: expired
                                    ? null
                                    : () {
                                        if (selectedIngredients
                                            .contains(ingredient.title)) {
                                          selectedIngredients
                                              .remove(ingredient.title);
                                        } else {
                                          selectedIngredients
                                              .add(ingredient.title);
                                        }
                                        setState(() {});
                                      },
                                title: Text(
                                  ingredient.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: expired ? Colors.grey : null),
                                ),
                                subtitle: !expired
                                    ? null
                                    : Text(
                                        "expired",
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: 50),
                    Center(
                      child: ElevatedButton(
                          onPressed: selectedIngredients.isEmpty
                              ? null
                              : () {
                                  String endpoint = "?ingredients=";
                                  for (var element in selectedIngredients) {
                                    endpoint += "$element,";
                                  }
                                  endpoint = endpoint.substring(
                                      0, endpoint.length - 1);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RecipeScreen(endpoint: endpoint),
                                      ));
                                },
                          child: Text(
                            "Continue",
                            style: TextStyle(fontSize: 16),
                          )),
                    )
                  ],
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    ));
  }
}
