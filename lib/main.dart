// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:meals_app/cubits/categories_cubit.dart';
import 'package:meals_app/cubits/meal_cubit.dart';
import 'package:meals_app/utils/generate_routes.dart';
import 'package:meals_app/views/home_view.dart';

void main() {
  runApp(const ApplicationRoot());
}

class ApplicationRoot extends StatelessWidget {
  const ApplicationRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MealCubit()),
        BlocProvider(create: (context) => CategoriesCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meals & Recipes',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        initialRoute: HomeView.routeName,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
