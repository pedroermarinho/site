import 'package:mobx/mobx.dart';

part 'container1_controller.g.dart';

class Container1Controller = _Container1ControllerBase
    with _$Container1Controller;

abstract class _Container1ControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
