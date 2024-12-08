import 'package:flutter_modular/flutter_modular.dart';
import 'package:pedroermarinho/app/ui/settings/settings_module.dart';

import 'home_page.dart';
import 'home_viewmodel.dart';
import 'pages/container4/container4_viewmodel.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    ...SettingsModule().binds,
    Bind((i) => Container4Controller()),
    Bind((i) => HomeController()),
  ];

  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
