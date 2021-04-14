import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'projetcs_controller.dart';
import 'projetcs_page.dart';
import 'repositories/github/github_repository_controller.dart';

// ignore: must_be_immutable
class ProjetcsModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind((i) => ProjetcsController()),
    Bind((i) => GithubRepositoryController()),
  ];

  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ProjetcsPage()),
  ];

  @override
  final Widget view = ProjetcsPage();
}
