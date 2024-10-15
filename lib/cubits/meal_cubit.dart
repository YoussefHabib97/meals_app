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
  var meal = const Meal();

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

  List<Meal> getMealsByCategory({required String categoryName}) {
    clearMealsByCategory();

    emit(MealLoading());

    mealsByCategory =
        meals.where((meal) => meal.strCategory == categoryName).toList();

    emit(MealSuccess());
    return [...mealsByCategory];
  }

  Future<Meal> getMealById({required String? id}) async {
    meal = const Meal();
    emit(MealLoading());

    try {
      var data = await ApiService().get(endPoint: 'lookup.php?i=$id');
      meal = Meal.fromMap(data['meals'][0]);

      emit(MealSuccess());
      return meal;
    } catch (e) {
      emit(MealFailure());
      rethrow;
    }
  }
}
