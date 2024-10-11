import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/utils/api_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              List<Meal> meals = [];

              var data = await ApiService().get(endPoint: 'random.php');

              for (var meal in data['meals']) {
                meals.add(Meal.fromMap(meal));
              }
              log(meals.toString());
            } catch (e) {
              rethrow;
            }
          },
          child: const Text("Fetch Data from API"),
        ),
      ),
    );
  }
}
