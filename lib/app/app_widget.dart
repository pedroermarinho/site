import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ui/shared/view_models/themes_viewmodel.dart';

class AppWidget extends StatefulWidget {
  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final themes = Modular.get<ThemesStore>();

  void update() => setState(() {});

  @override
  void initState() {
    super.initState();

    themes.addListener(update);
  }

  @override
  void dispose() {
    themes.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    themes.setContext(context);
    Modular.setObservers([Asuka.asukaHeroController]);

    return MaterialApp.router(
      title: 'Pedro Marinho',
      theme: themes.themeActual,
      builder: Asuka.builder,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
