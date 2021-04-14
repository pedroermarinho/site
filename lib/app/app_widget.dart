import 'package:asuka/asuka.dart' as asuka show builder;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'core/external/stores/theme/themes_store.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themes = Modular.get<ThemesStore>();
    themes.setContext(context);
    return Observer(
      builder: (_) => MaterialApp(
        title: 'Pedro Marinho',
        theme: themes.themeActual,
        initialRoute: "/",
        builder: asuka.builder,
      ).modular(),
    );
  }
}
