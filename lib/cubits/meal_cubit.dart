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

  Future<void> getMeals() async {
    try {
      emit(MealLoading());
      var data = await ApiService().get(endPoint: 'search.php?s=');

      for (var meal in data['meals']) {
        meals.add(Meal.fromMap(meal));
      }

      emit(MealSuccess());
    } on Exception {
      emit(MealFailure());
      rethrow;
    }
  }
}
