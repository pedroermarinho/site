import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pedroermarinho/app/ui/projects/projects_module.dart';

import 'markdown_page.dart';
import 'markdown_viewmodel.dart';

// ignore: must_be_immutable
class MarkdownModule extends WidgetModule {
  final List<Bind> binds = [
    ...ProjectsModule().binds,
    Bind((i) => MarkdownController()),
  ];

  final List<ModularRoute> routers = [
    ChildRoute(Modular.initialRoute, child: (_, args) => MarkdownPage()),
  ];

  @override
  final Widget view = MarkdownPage();
}
