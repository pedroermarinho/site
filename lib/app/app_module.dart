import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:site/app/app_controller.dart';
import 'package:site/app/app_widget.dart';
import 'package:site/app/components/layout_custom/layout_custom_controller.dart';
import 'package:site/app/components/line/line_controller.dart';
import 'package:site/app/components/link/link_controller.dart';
import 'package:site/app/components/menu/menu_controller.dart';
import 'package:site/app/components/responsive/responsive_controller.dart';
import 'package:site/app/components/skills/skills_controller.dart';
import 'package:site/app/components/text_icon/text_icon_controller.dart';
import 'package:site/app/modules/home/home_module.dart';
import 'package:site/app/pages/about/about_controller.dart';
import 'package:site/app/pages/splash_screen/splash_screen_controller.dart';
import 'package:site/app/repositories/github/github_repository_controller.dart';
import 'package:site/app/repositories/shared_preferences/shared_preferences_repository_controller.dart';
import 'package:site/app/shared/config/theme/themes_controller.dart';

import 'components/item_information/item_information_controller.dart';
import 'components/item_project/item_project_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ItemProjectController()),
        Bind((i) => ItemInformationController()),
        Bind((i) => LinkController()),
        Bind((i) => SkillsController()),
        Bind((i) => LineController()),
        Bind((i) => TextIconController()),
        Bind((i) => SplashScreenController()),
        Bind((i) => AboutController()),
        Bind((i) => AppController()),
        Bind((i) => SharedPreferencesRepositoryController()),
        Bind((i) => ThemesController()),
        Bind((i) => LayoutCustomController()),
        Bind((i) => GithubRepositoryController()),
        Bind((i) => MenuController()),
        Bind((i) => ResponsiveController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
