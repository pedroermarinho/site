import 'package:flutter_modular/flutter_modular.dart';
import 'package:pedroermarinho/app/modules/settings/settings_module.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'pages/container1/container1_controller.dart';
import 'pages/container2/container2_controller.dart';
import 'pages/container3/container3_controller.dart';
import 'pages/container4/container4_controller.dart';
import 'pages/container5/container5_controller.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    ...SettingsModule().binds,
    Bind((i) => Container5Controller()),
    Bind((i) => Container4Controller()),
    Bind((i) => Container3Controller()),
    Bind((i) => Container2Controller()),
    Bind((i) => Container1Controller()),
    Bind((i) => HomeController()),
  ];

  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
