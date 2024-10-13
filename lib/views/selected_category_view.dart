import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  return const ListTile(
                    title: Text(""),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemCount: 2,
              ),
            );
          } else if (state is MealSuccess) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(BlocProvider.of<MealCubit>(context)
                      .getMealsByCategory(category: categoryName)[index]
                      .strMeal!),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemCount: 2,
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
