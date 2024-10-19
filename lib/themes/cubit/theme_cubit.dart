// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:meals_app/constants/themes.dart';
import 'package:meals_app/utils/shared_prefs_service.dart';

part 'theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitialState());

  Set<ThemeState> getThemeState() {
    switch (SharedPrefsService.instance.getData(key: kAppThemeKey)) {
      case kAppThemeLight:
        return {ThemeState.light};

      case kAppThemeDark:
        return {ThemeState.dark};

      default:
        return {ThemeState.deviceDefault};
    }
  }

  void setTheme(ThemeState themeState) {
    switch (themeState) {
      case ThemeState.light:
        SharedPrefsService.instance
            .setData(key: kAppThemeKey, value: kAppThemeLight);
        emit(LightThemeState());

      case ThemeState.dark:
        SharedPrefsService.instance
            .setData(key: kAppThemeKey, value: kAppThemeDark);
        emit(DarkThemeState());

      default:
        SharedPrefsService.instance
            .setData(key: kAppThemeKey, value: kAppThemeDeviceDefault);
        emit(DeviceDefaultThemeState());
    }
  }
}
