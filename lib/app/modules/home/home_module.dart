import 'pages/container5/container5_controller.dart';
import 'pages/container4/container4_controller.dart';
import 'pages/container3/container3_controller.dart';
import 'pages/container2/container2_controller.dart';
import 'pages/container1/container1_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Container5Controller()),
        Bind((i) => Container4Controller()),
        Bind((i) => Container3Controller()),
        Bind((i) => Container2Controller()),
        Bind((i) => Container1Controller()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
