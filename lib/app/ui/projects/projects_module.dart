import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'projects_page.dart';
import 'projects_viewmodel.dart';

class ProjectsModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind((i) => ProjectsController()),
  ];

  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ProjectsPage()),
  ];

  @override
  final Widget view = ProjectsPage();
}
