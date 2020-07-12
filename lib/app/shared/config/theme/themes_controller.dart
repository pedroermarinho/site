import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:site/app/repositories/shared_preferences/shared_preferences_repository_controller.dart';
import 'package:site/app/shared/config/constants.dart';
import 'package:site/app/shared/config/theme/themes.dart';

part 'themes_controller.g.dart';

class ThemesController = _ThemesControllerBase with _$ThemesController;

abstract class _ThemesControllerBase with Store {
  final _preferencesRepositoryController =
      Modular.get<SharedPreferencesRepositoryController>();

  @observable
  ThemeOption theme = ThemeOption.lightTheme;

  BuildContext _context;

  @action
  void setContext(BuildContext context) => _context = context;

  _ThemesControllerBase() {
    getTheme();
  }

  getTheme() async {
    _preferencesRepositoryController.getTheme().then((value) {
      print(value);
      if (value != null) {
        theme = value;
      }
    });
  }

  @computed
  ThemeData get themeActual {
    if (theme == ThemeOption.darkTheme) {
      return darkTheme(_context);
    } else {
      return lightTheme(_context);
    }
  }

  @action
  changeTheme() {
    if (theme == ThemeOption.lightTheme) {
      theme = ThemeOption.darkTheme;
    } else {
      theme = ThemeOption.lightTheme;
    }
    _preferencesRepositoryController.saveTheme(theme);
  }
}
