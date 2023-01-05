import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/external/stores/theme/themes_store.dart';

part 'container1_controller.g.dart';

class Container1Controller = _Container1ControllerBase
    with _$Container1Controller;

abstract class _Container1ControllerBase with Store {
  final _themesController = Modular.get<ThemesStore>();

  @computed
  bool get isThemeDark => _themesController.isDark;

  @action
  void changeTheme() {
    _themesController.changeTheme();
  }
}
