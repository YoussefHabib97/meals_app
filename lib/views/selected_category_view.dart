// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:meals_app/views/widgets/selected_category_view_body.dart';

// Package imports:


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
      body: SelectedCategoryViewBody(categoryName: categoryName),
    );
  }
}
