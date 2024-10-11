import 'package:flutter/material.dart';
import 'package:meals_app/utils/generate_routes.dart';
import 'package:meals_app/views/home_view.dart';

void main() {
  runApp(const ApplicationRoot());
}

class ApplicationRoot extends StatelessWidget {
  const ApplicationRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals & Recipes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      initialRoute: HomeView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
