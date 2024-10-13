// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:meals_app/views/categories_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case CategoriesView.routeName:
      return MaterialPageRoute(builder: (context) => const CategoriesView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
