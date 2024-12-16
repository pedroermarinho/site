import 'package:flutter/cupertino.dart';

import '../home/home_viewmodel.dart';
import '../shared/view_models/themes_viewmodel.dart';

class SettingsViewModel extends ChangeNotifier {
  final ThemesViewModel themesController;
  final HomeViewModel homeViewModel;

  SettingsViewModel({required this.themesController, required this.homeViewModel});

  bool get isThemeDark => themesController.isDark;

  void changeTheme() {
    themesController.changeTheme();
    notifyListeners();
  }

  void openProjects() {
    homeViewModel.openProjects();
    notifyListeners();
  }

  void openAbout() {
    homeViewModel.openAbout();
    notifyListeners();
  }

  void openMarkdown() {
    homeViewModel.openMarkdown();
    notifyListeners();
  }
}
