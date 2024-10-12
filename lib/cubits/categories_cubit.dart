// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:meals_app/models/category.dart';
import 'package:meals_app/utils/api_service.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  List<Category> categories = [];

  Future<List<Category>> getCategories() async {
    categories = [];
    try {
      emit(CategoriesLoading());
      var data = await ApiService().get(endPoint: 'categories.php');

      for (var category in data['categories']) {
        categories.add(Category.fromMap(category));
      }

      emit(CategoriesSuccess());
      log(categories.toString());
      return [...categories];
    } catch (e) {
      emit(CategoriesFailure());
      rethrow;
    }
  }
}
