// Flutter imports:
import 'package:flutter/material.dart';
import 'package:meals_app/themes/widgets/theme_switcher.dart';

// Project imports:
import 'widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});
  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: ThemeSwitcher(),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Categories"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const CategoriesViewBody(),
    );
  }
}
