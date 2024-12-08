import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pedroermarinho/app/ui/projects/projects_module.dart';

import 'settings_page.dart';
import 'settings_viewmodel.dart';

// ignore: must_be_immutable
class SettingsModule extends WidgetModule {
  final List<Bind> binds = [
    ...ProjectsModule().binds,
    Bind((i) => SettingsViewModel()),
  ];

  final List<ModularRoute> routers = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SettingsPage()),
  ];

  @override
  final Widget view = SettingsPage();
}
