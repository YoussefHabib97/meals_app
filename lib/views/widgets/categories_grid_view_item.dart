// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:meals_app/models/category.dart';
import 'package:meals_app/views/selected_category_view.dart';

class CategoriesGridViewItem extends StatelessWidget {
  const CategoriesGridViewItem({
    super.key,
    required this.category,
  });
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  SelectedCategoryView(categoryName: category.strCategory!),
            ),
          );
        },
        child: GridTile(
          footer: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text(
              category.strCategory!,
              style: const TextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          child: Image.network(category.strCategoryThumb!),
        ),
      ),
    );
  }
}
