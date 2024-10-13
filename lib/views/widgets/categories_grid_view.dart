// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:meals_app/cubits/categories_cubit.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/views/widgets/categories_grid_view_item.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key,
    required this.categories,
  });

  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemCount: BlocProvider.of<CategoriesCubit>(context).categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CategoriesGridViewItem(
            category: categories[index],
          ),
        );
      },
    );
  }
}
