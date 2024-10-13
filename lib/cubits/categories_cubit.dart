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

  void clearCategoriesList() {
    categories.clear();
  }

  Future<List<Category>> getCategories() async {
    clearCategoriesList();

    emit(CategoriesLoading());

    try {
      var data = await ApiService().get(endPoint: 'categories.php');

      for (var category in data['categories']) {
        categories.add(Category.fromMap(category));
      }

      categories.removeWhere(
        (element) => element.strCategory!.contains('Pork'),
      );

      emit(CategoriesSuccess());
      return [...categories];
    } catch (e) {
      emit(CategoriesFailure());
      rethrow;
    }
  }
}
