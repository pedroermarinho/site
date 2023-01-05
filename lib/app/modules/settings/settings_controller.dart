import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/external/stores/theme/themes_store.dart';
import '../home/home_controller.dart';

part 'settings_controller.g.dart';

class SettingsController = _SettingsControllerBase with _$SettingsController;

abstract class _SettingsControllerBase with Store {
  final _themesController = Modular.get<ThemesStore>();
  final _homeController = Modular.get<HomeController>();

  @computed
  bool get isThemeDark => _themesController.isDark;

  @action
  void changeTheme() {
    _themesController.changeTheme();
  }

  @action
  void openProjects() {
    _homeController.openProjects();
  }

  @action
  void openAbout() {
    _homeController.openAbout();
  }
}
