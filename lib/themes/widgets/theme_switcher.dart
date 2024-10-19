// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:meals_app/constants/themes.dart';
import 'package:meals_app/themes/cubit/theme_cubit.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AppThemeCubit>(context);
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return SegmentedButton(
          showSelectedIcon: false,
          selected: cubit.getThemeState(),
          onSelectionChanged: (newThemeState) {
            switch (newThemeState.first) {
              case ThemeState.light:
                BlocProvider.of<AppThemeCubit>(context)
                    .setTheme(ThemeState.light);
              case ThemeState.dark:
                BlocProvider.of<AppThemeCubit>(context)
                    .setTheme(ThemeState.dark);
              default:
                BlocProvider.of<AppThemeCubit>(context)
                    .setTheme(ThemeState.deviceDefault);
            }
          },
          segments: const [
            ButtonSegment(
              tooltip: 'Light Theme',
              icon: Icon(Icons.light_mode_rounded),
              value: ThemeState.light,
            ),
            ButtonSegment(
              tooltip: 'System Default',
              icon: Icon(Icons.phone_android_rounded),
              value: ThemeState.deviceDefault,
            ),
            ButtonSegment(
              tooltip: 'Dark Theme',
              icon: Icon(Icons.dark_mode_rounded),
              value: ThemeState.dark,
            ),
          ],
        );
      },
    );
  }
}
