// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/constants/themes.dart';

// Project imports:
import 'package:meals_app/cubits/categories_cubit.dart';
import 'package:meals_app/cubits/meal_cubit.dart';
import 'package:meals_app/themes/cubit/theme_cubit.dart';
import 'package:meals_app/utils/generate_routes.dart';
import 'package:meals_app/utils/shared_prefs_service.dart';
import 'package:meals_app/views/categories_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsService.instance.initSharedPrefs();
  runApp(const ApplicationRoot());
}

class ApplicationRoot extends StatelessWidget {
  const ApplicationRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppThemeCubit()),
        BlocProvider(create: (context) => CategoriesCubit()..getCategories()),
        BlocProvider(create: (context) => MealCubit()..getMeals()),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Meals & Recipes',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blueGrey,
              ),
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blueGrey,
                brightness: Brightness.dark,
              ),
            ),
            themeMode: state is DeviceDefaultThemeState ||
                    SharedPrefsService.instance.getData(key: kAppThemeKey) ==
                        kAppThemeDeviceDefault
                ? ThemeMode.system
                : state is LightThemeState ||
                        SharedPrefsService.instance
                                .getData(key: kAppThemeKey) ==
                            kAppThemeLight
                    ? ThemeMode.light
                    : ThemeMode.dark,
            initialRoute: CategoriesView.routeName,
            onGenerateRoute: onGenerateRoute,
          );
        },
      ),
    );
  }
}
