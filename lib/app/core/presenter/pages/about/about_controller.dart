import 'package:mobx/mobx.dart';

import '../../../../modules/home/home_controller.dart';

part 'about_controller.g.dart';

class AboutController = _AboutControllerBase with _$AboutController;

abstract class _AboutControllerBase with Store {
  final HomeController homeController;

  _AboutControllerBase({required this.homeController});

  void closeAbout() {
    homeController.closeAbout();
  }
}
