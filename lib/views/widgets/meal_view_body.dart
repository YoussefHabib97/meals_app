// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:meals_app/constants/assets.dart';
import 'package:meals_app/cubits/meal_cubit.dart';
import 'package:meals_app/utils/instructions_string_splitter.dart';

class MealViewBody extends StatefulWidget {
  final String mealId;
  const MealViewBody({
    super.key,
    required this.mealId,
  });

  @override
  State<MealViewBody> createState() => _MealViewBodyState();
}

class _MealViewBodyState extends State<MealViewBody> {
  int ingredientCount = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await BlocProvider.of<MealCubit>(context)
            .getMealById(id: widget.mealId);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MealCubit, MealState, MealState>(
      selector: (state) =>
          state, // Selecting the entire state (can be optimized later)
      builder: (context, selectedState) {
        // Use a local variable for the cubit
        final mealCubit = BlocProvider.of<MealCubit>(context);

        // Check the state of the BLoC
        if (selectedState is MealInitial || selectedState is MealLoading) {
          return Skeletonizer(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Text(
                    "Placeholder",
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Image.asset(Assets.assets700x700),
                  const SizedBox(height: 16),
                  const ExpansionTile(
                    title: Text("Ingredients"),
                    children: [],
                  ),
                  const ExpansionTile(
                    title: Text("Instructions"),
                    children: [],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text("Watch Recipe"),
                    icon: const Icon(Icons.play_arrow_rounded),
                  ),
                ],
              ),
            ),
          );
        } else if (selectedState is MealSuccess) {
          // Store the meal object
          final meal = mealCubit.meal;

          // Check for null idMeal
          if (meal.idMeal == null) {
            return Skeletonizer(
              child:
                  _buildPlaceholder(), // Extract placeholder logic to a method
            );
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    meal.strMeal!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Image.network(meal.strMealThumb!),
                  const SizedBox(height: 16),
                  ExpansionTile(
                    title: const Text(
                      "Ingredients",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    children: generateIngredientTiles(meal.toMap()),
                  ),
                  ExpansionTile(
                    title: const Text(
                      "Instructions",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    children: generateInstructionTiles(meal.strInstructions!),
                  ),
                  if (meal.strYoutube != null)
                    ElevatedButton.icon(
                      onPressed: () async {
                        try {
                          launchUrl(Uri.parse(meal.strYoutube!));
                        } catch (e) {
                          rethrow; // Handle the error appropriately
                        }
                      },
                      label: const Text("Watch Recipe"),
                      icon: const Icon(Icons.play_arrow_rounded),
                    )
                  else
                    const SizedBox(),
                ],
              ),
            );
          }
        }
        return const Center(
          child: Text("An error has occurred"),
        );
      },
    );
  }

  // Method to extract placeholder logic
  Widget _buildPlaceholder() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const Text(
            "Placeholder",
            style: TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Image.asset(Assets.assets700x700),
          const SizedBox(height: 16),
          const ExpansionTile(
            title: Text("Ingredients"),
            children: [],
          ),
          const ExpansionTile(
            title: Text("Instructions"),
            children: [],
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text("Watch Recipe"),
            icon: const Icon(Icons.play_arrow_rounded),
          ),
        ],
      ),
    );
  }

  List<Widget> generateIngredientTiles(Map<String, dynamic> mealData) {
    var cubit = BlocProvider.of<MealCubit>(context);
    List<Widget> ingredientListTiles = [];

    var mealJson = cubit.meal.toMap();

    for (int i = 1; i <= 20; i++) {
      String ingredientKey = 'strIngredient$i';
      String measureKey = 'strMeasure$i';

      String? ingredient = mealData[ingredientKey];
      String? measure = mealJson[measureKey];

      if (ingredient != null &&
          ingredient.isNotEmpty &&
          measure != null &&
          measure.isNotEmpty) {
        ingredientListTiles.add(
          ListTile(
            title: Text(ingredient),
            trailing: Text(measure),
          ),
        );
      }
    }
    return ingredientListTiles;
  }

  List<Widget> generateInstructionTiles(String instructions) {
    List<String> instructionSteps = splitInstructions(instructions);
    List<Widget> instructionStepsTiles = [];

    for (int i = 0; i < instructionSteps.length; i++) {
      instructionStepsTiles.add(
        ListTile(
          title: Text('${i + 1}. ${instructionSteps[i]}'),
        ),
      );
    }
    return instructionStepsTiles;
  }
}
