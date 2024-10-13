// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'package:meals_app/constants/assets.dart';
import 'package:meals_app/cubits/meal_cubit.dart';
import 'package:meals_app/views/widgets/meal_list_item.dart';

class SelectedCategoryViewBody extends StatelessWidget {
  const SelectedCategoryViewBody({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        if (state is MealInitial || state is MealLoading) {
          return Skeletonizer(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(Assets.assets320x200),
                  title: const Text("Placeholder Text"),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemCount: 8,
            ),
          );
        } else if (state is MealSuccess) {
          return BlocProvider.of<MealCubit>(context)
                  .getMealsByCategory(categoryName: categoryName)
                  .isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    return MealListItem(
                      categoryName: categoryName,
                      index: index,
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
    );
  }
}
