// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:meals_app/views/widgets/meal_view_body.dart';

// Package imports:


class MealView extends StatelessWidget {
  const MealView({
    super.key,
    required this.mealId,
  });

  final String mealId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MealViewBody(
        mealId: mealId,
      ),
    );
  }
}
