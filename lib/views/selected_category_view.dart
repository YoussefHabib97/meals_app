import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/constants/assets.dart';
import 'package:meals_app/cubits/meal_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SelectedCategoryView extends StatelessWidget {
  final String categoryName;
  const SelectedCategoryView({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
          tooltip: "Back",
        ),
      ),
      body: BlocBuilder<MealCubit, MealState>(
        builder: (context, state) {
          if (state is MealInitial || state is MealLoading) {
            return Skeletonizer(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(Assets.assetsSkeletonImage),
                    title: const Text("Placeholder Text"),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemCount: 10,
              ),
            );
          } else if (state is MealSuccess) {
            return BlocProvider.of<MealCubit>(context)
                    .getMealsByCategory(categoryName: categoryName)
                    .isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(
                          BlocProvider.of<MealCubit>(context)
                              .getMealsByCategory(
                                  categoryName: categoryName)[index]
                              .strMealThumb!,
                        ),
                        title: Text(BlocProvider.of<MealCubit>(context)
                            .getMealsByCategory(
                                categoryName: categoryName)[index]
                            .strMeal!),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 8);
                    },
                    itemCount: BlocProvider.of<MealCubit>(context)
                        .getMealsByCategory(categoryName: categoryName)
                        .length,
                  )
                : const Center(
                    child: Text("This category currently has no meals"),
                  );
          }
          return const Center(
            child: Text("An error has occured. Please try again later."),
          );
        },
      ),
    );
  }
}
