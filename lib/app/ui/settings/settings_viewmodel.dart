import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_viewmodel.dart';
import '../shared/view_models/themes_viewmodel.dart';

class SettingsViewModel extends ChangeNotifier {
  final _themesController = Modular.get<ThemesStore>();
  final _homeController = Modular.get<HomeController>();

  bool get isThemeDark => _themesController.isDark;

  void changeTheme() {
    _themesController.changeTheme();
    notifyListeners();
  }

  void openProjects() {
    _homeController.openProjects();
    notifyListeners();
  }

  void openAbout() {
    _homeController.openAbout();
    notifyListeners();
  }

  void openMarkdown() {
    _homeController.openMarkdown();
    notifyListeners();
  }
}
