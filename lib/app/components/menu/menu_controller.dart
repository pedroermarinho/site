import 'package:mobx/mobx.dart';

part 'menu_controller.g.dart';

class MenuController = _MenuControllerBase with _$MenuController;

abstract class _MenuControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
