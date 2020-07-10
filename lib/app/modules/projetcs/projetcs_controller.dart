import 'package:mobx/mobx.dart';

part 'projetcs_controller.g.dart';

class ProjetcsController = _ProjetcsControllerBase with _$ProjetcsController;

abstract class _ProjetcsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
