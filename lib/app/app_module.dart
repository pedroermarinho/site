import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pedroermarinho/app/app_controller.dart';
import 'package:pedroermarinho/app/app_widget.dart';
import 'package:pedroermarinho/app/components/layout_custom/layout_custom_controller.dart';
import 'package:pedroermarinho/app/components/responsive/responsive_controller.dart';
import 'package:pedroermarinho/app/modules/home/home_module.dart';
import 'package:pedroermarinho/app/modules/projetcs/projetcs_module.dart';
import 'package:pedroermarinho/app/pages/about/about_controller.dart';
import 'package:pedroermarinho/app/pages/splash_screen/splash_screen_controller.dart';
import 'package:pedroermarinho/app/repositories/shared_preferences/shared_preferences_repository_controller.dart';
import 'package:pedroermarinho/app/shared/config/theme/themes_controller.dart';

import 'components/project_component/project_component_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProjectComponentController()),
        Bind((i) => SplashScreenController()),
        Bind((i) => AboutController()),
        Bind((i) => AppController()),
        Bind((i) => SharedPreferencesRepositoryController()),
        Bind((i) => ThemesController()),
        Bind((i) => LayoutCustomController()),
        Bind((i) => ResponsiveController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router("/projects", module: ProjetcsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
