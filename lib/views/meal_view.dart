import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealView extends StatelessWidget {
  const MealView({
    super.key,
    required this.mealId,
  });
  final String mealId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(
          mealId.toString(),
        ),
      ),
    );
  }
}
