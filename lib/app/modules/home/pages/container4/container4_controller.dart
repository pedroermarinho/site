import 'package:mobx/mobx.dart';

part 'container4_controller.g.dart';

class Container4Controller = _Container4ControllerBase
    with _$Container4Controller;

abstract class _Container4ControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
