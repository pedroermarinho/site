import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pedroermarinho/app/modules/projetcs/projetcs_module.dart';

import 'settings_controller.dart';
import 'settings_page.dart';

// ignore: must_be_immutable
class SettingsModule extends WidgetModule {
  final List<Bind> binds = [
    ...ProjetcsModule().binds,
    Bind((i) => SettingsController()),
  ];

  final List<ModularRoute> routers = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SettingsPage()),
  ];

  @override
  final Widget view = SettingsPage();
}
