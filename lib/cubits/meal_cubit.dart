// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/utils/api_service.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealInitial());

  List<Meal> meals = [];
  List<Meal> mealsByCategory = [];

  void clearMeals() {
    meals.clear();
  }

  void clearMealsByCategory() {
    mealsByCategory.clear();
  }

  Future<List<Meal>> getMeals() async {
    clearMeals();

    emit(MealLoading());

    try {
      var data = await ApiService().get(endPoint: 'search.php?s=');

      for (var meal in data['meals']) {
        meals.add(Meal.fromMap(meal));
      }

      emit(MealSuccess());
      return [...meals];
    } catch (e) {
      emit(MealFailure());
      rethrow;
    }
  }

  List<Meal> getMealsByCategory({required String category}) {
    clearMealsByCategory();

    emit(MealLoading());

    mealsByCategory =
        meals.where((meal) => meal.strCategory == category).toList();

    emit(MealSuccess());
    return [...mealsByCategory];
  }
}
