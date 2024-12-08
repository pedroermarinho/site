import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/repositories/github/github_repository_remote.dart';
import 'data/repositories/settings/settings_repository_remote.dart';
import 'data/repositories/theme/theme_repository_local.dart';
import 'data/services/storage_service_local.dart';
import 'domain/use_cases/get_repo.dart';
import 'domain/use_cases/get_settings.dart';
import 'domain/use_cases/get_theme.dart';
import 'domain/use_cases/get_user.dart';
import 'domain/use_cases/set_theme.dart';
import 'ui/home/home_module.dart';
import 'ui/projects/projects_module.dart';
import 'ui/shared/components/loading_dialog.dart';
import 'ui/shared/components/success_dialog.dart';
import 'ui/shared/pages/about/about_viewmodel.dart';
import 'ui/shared/pages/splash_screen/splash_screen_viewmodel.dart';
import 'ui/shared/view_models/settings_viewmodel.dart';
import 'ui/shared/view_models/themes_viewmodel.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    BindInject((i) => StorageServiceLocal(), isSingleton: false),
    Bind.lazySingleton((i) => LoadingDialogImpl()),
    Bind.lazySingleton((i) => SuccessDialogImpl()),
    Bind((i) => SetThemeImpl(i()), isSingleton: false),
    Bind((i) => GetThemeImpl(i()), isSingleton: false),
    Bind((i) => ThemeRepositoryLocal(i()), isSingleton: false),
    Bind((i) => GetThemeImpl(i())),
    Bind.lazySingleton((i) => ThemesStoreImpl(getTheme: i(), setTheme: i())),
    // Bind((i) => SettingsRepositoryLocal()),
    Bind((i) => SettingsRepositoryRemote(dio: i())),
    Bind((i) => GetSettingsImpl(i())),
    Bind((i) => SettingsStoreImpl(i())),
    Bind.lazySingleton((i) => GithubRepositoryRemote(dio: i(), getSettings: i())),
    Bind.lazySingleton((i) => GetRepoImpl(i())),
    Bind.lazySingleton((i) => GetUserImpl(i())),
    Bind((i) => SplashScreenController()),
    Bind((i) => AboutController(homeController: i())),
  ];

  final List<ModularRoute> routes = [ModuleRoute(Modular.initialRoute, module: HomeModule()), ChildRoute("/projects", child: (_, args) => ProjectsModule())];
}
