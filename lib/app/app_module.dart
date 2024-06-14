import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/domain/usercases/get_repo.dart';
import 'core/domain/usercases/get_settings.dart';
import 'core/domain/usercases/get_theme.dart';
import 'core/domain/usercases/get_user.dart';
import 'core/domain/usercases/set_theme.dart';
import 'core/external/datasources/github_datasource_impl.dart';
import 'core/external/datasources/settings_datasource_impl.dart';
import 'core/external/datasources/theme_datasource_impl.dart';
import 'core/external/drivers/shared_storage_driver_impl.dart';
import 'core/external/stores/settings/settings_store.dart';
import 'core/external/stores/theme/themes_store.dart';
import 'core/infra/repositories/github_repository_impl.dart';
import 'core/infra/repositories/settings_repository_impl.dart';
import 'core/infra/repositories/theme_repository_impl.dart';
import 'core/infra/services/storage_service_impl.dart';
import 'core/presenter/components/loading_dialog.dart';
import 'core/presenter/components/success_dialog.dart';
import 'core/presenter/pages/about/about_controller.dart';
import 'core/presenter/pages/splash_screen/splash_screen_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/projetcs/projects_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    BindInject((i) => SharedStorageDriver(), isSingleton: false),
    Bind((i) => StorageServiceImpl(i()), isSingleton: false),
    Bind.lazySingleton((i) => LoadingDialogImpl()),
    Bind.lazySingleton((i) => SuccessDialogImpl()),
    Bind((i) => SetThemeImpl(i()), isSingleton: false),
    Bind((i) => GetThemeImpl(i()), isSingleton: false),
    Bind((i) => ThemeDataSourceImpl(i()), isSingleton: false),
    Bind((i) => ThemeRepositoryImpl(i()), isSingleton: false),
    Bind((i) => GetThemeImpl(i())),
    Bind.lazySingleton((i) => ThemesStoreImpl(getTheme: i(), setTheme: i())),
    Bind((i) => SettingsDataSourceImpl(dio: i())),
    Bind((i) => SettingsRepositoryImpl(i())),
    Bind((i) => GetSettingsImpl(i())),
    Bind((i) => SettingsStoreImpl(i())),
    Bind.lazySingleton((i) => GitHubDataSourceImpl(dio: i(), getSettings: i())),
    Bind.lazySingleton((i) => GitHubRepositoryImpl(i())),
    Bind.lazySingleton((i) => GetRepoImpl(i())),
    Bind.lazySingleton((i) => GetUserImpl(i())),
    Bind((i) => SplashScreenController()),
    Bind((i) => AboutController(homeController: i())),
  ];

  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ChildRoute("/projects", child: (_, args) => ProjectsModule())
  ];
}
