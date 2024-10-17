part of 'theme_cubit.dart';

sealed class AppThemeState extends Equatable {
  const AppThemeState();

  @override
  List<Object> get props => [];
}

final class AppThemeInitialState extends AppThemeState {}

final class DeviceDefaultThemeState extends AppThemeState {}

final class LightThemeState extends AppThemeState {}

final class DarkThemeState extends AppThemeState {}
