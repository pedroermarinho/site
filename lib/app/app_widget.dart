import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/external/stores/theme/themes_store.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themes = Modular.get<ThemesStore>();
    themes.setContext(context);
    Modular.setObservers([Asuka.asukaHeroController]);
    return Observer(
      builder: (_) => MaterialApp.router(
        title: 'Pedro Marinho',
        theme: themes.themeActual,
        builder: Asuka.builder,
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
      ),
    );
  }
}
