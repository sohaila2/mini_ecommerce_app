import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../di/dependency_injection.dart';
import 'dark_theme.dart';
import 'light_theme.dart';
part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeState(themeMode: ThemeMode.light));
  static ChangeThemeCubit get get => getIt();

  static ChangeThemeCubit of(BuildContext context) =>
      BlocProvider.of<ChangeThemeCubit>(context);

  bool isDark() => state.themeMode == ThemeMode.dark;

  void toggleTheme() {
    emit(ChangeThemeState(
      themeMode: isDark() ? ThemeMode.light : ThemeMode.dark,
    ));
  }

  ThemeMode themeMode() => state.themeMode;

  ThemeData themeData() {
    return state.themeMode == ThemeMode.dark ? darkTheme() : lightTheme();
  }
}
