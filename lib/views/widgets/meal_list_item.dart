// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'package:meals_app/constants/assets.dart';
import 'package:meals_app/cubits/meal_cubit.dart';
import 'package:meals_app/views/meal_view.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({
    super.key,
    required this.categoryName,
    required this.index,
  });

  final String categoryName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MealView(
                mealId: BlocProvider.of<MealCubit>(context)
                    .getMealsByCategory(categoryName: categoryName)[index]
                    .idMeal!,
              ),
            ),
          );
        },
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Image.network(
              BlocProvider.of<MealCubit>(context)
                  .getMealsByCategory(categoryName: categoryName)[index]
                  .strMealThumb!,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : Skeletonizer(
                          child: Image.asset(Assets.assets700x700),
                        ),
            ),
          ),
          title: Text(BlocProvider.of<MealCubit>(context)
              .getMealsByCategory(categoryName: categoryName)[index]
              .strMeal!),
        ),
      ),
    );
  }
}
