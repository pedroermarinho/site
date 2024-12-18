import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';

import 'config/providers.dart';
import 'domain/view_models/themes_viewmodel.dart';
import 'ui/shared/pages/splash_screen/splash_screen_page.dart';

class AppWidget extends StatefulWidget {
  final ThemesViewModel themes;

  const AppWidget({required this.themes, super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  void update() => setState(() {});

  @override
  void initState() {
    super.initState();

    widget.themes.addListener(update);
  }

  @override
  void dispose() {
    widget.themes.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.themes.setContext(context);
    return MaterialApp(
      title: 'Pedro Marinho',
      theme: widget.themes.themeActual,
      builder: Asuka.builder,
      home: SplashScreenPage(splashScreenViewModel: getIt()),
    );
  }
}
