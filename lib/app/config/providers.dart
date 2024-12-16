import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/github/github_repository.dart';
import '../data/repositories/github/github_repository_remote.dart';
import '../data/repositories/settings/settings_repository.dart';
import '../data/repositories/settings/settings_repository_local.dart';
import '../data/repositories/settings/settings_repository_remote.dart';
import '../data/repositories/theme/theme_repository.dart';
import '../data/repositories/theme/theme_repository_local.dart';
import '../data/services/storage_service.dart';
import '../data/services/storage_service_local.dart';
import '../domain/use_cases/get_repo.dart';
import '../domain/use_cases/get_settings.dart';
import '../domain/use_cases/get_theme.dart';
import '../domain/use_cases/get_user.dart';
import '../domain/use_cases/set_theme.dart';
import '../ui/home/home_providers.dart';
import '../ui/markdown/markdown_providers.dart';
import '../ui/projects/projects_providers.dart';
import '../ui/settings/settings_providers.dart';
import '../ui/shared/components/loading_dialog.dart';
import '../ui/shared/components/success_dialog.dart';
import '../ui/shared/pages/splash_screen/splash_screen_viewmodel.dart';
import '../ui/shared/view_models/modal_viewmodel.dart';
import '../ui/shared/view_models/settings_viewmodel.dart';
import '../ui/shared/view_models/themes_viewmodel.dart';
import 'environment.dart';

final getIt = GetIt.instance;

void setupProviders() {
  getIt.registerLazySingleton(Dio.new);
  getIt.registerLazySingleton<StorageService>(StorageServiceLocal.new);
  getIt.registerLazySingleton<LoadingDialog>(LoadingDialogImpl.new);
  getIt.registerLazySingleton<SuccessDialog>(SuccessDialogImpl.new);
  getIt.registerLazySingleton<SetTheme>(() => SetThemeImpl(getIt()));
  getIt.registerLazySingleton<GetTheme>(() => GetThemeImpl(getIt()));
  getIt.registerLazySingleton<ThemeRepository>(() => ThemeRepositoryLocal(getIt()));
  getIt.registerLazySingleton<ThemesViewModel>(() => ThemesViewModelImpl(getTheme: getIt(), setTheme: getIt()));
  if (isProduction) {
    getIt.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryRemote(dio: getIt()));
  } else {
    getIt.registerLazySingleton<SettingsRepository>(SettingsRepositoryLocal.new);
  }
  getIt.registerLazySingleton<GetSettings>(() => GetSettingsImpl(getIt()));
  getIt.registerLazySingleton<SettingsViewModel>(() => SettingsViewModelImpl(getIt()));
  getIt.registerLazySingleton<GitHubRepository>(() => GithubRepositoryRemote(dio: getIt(), getSettings: getIt()));
  getIt.registerLazySingleton<GetRepo>(() => GetRepoImpl(getIt()));
  getIt.registerLazySingleton<GetUser>(() => GetUserImpl(getIt()));
  getIt.registerLazySingleton<SplashScreenViewModel>(SplashScreenViewModel.new);
  getIt.registerLazySingleton<ModalViewModel>(ModalViewModel.new);
  homeProviders();
  projectsProviders();
  settingsProviders();
  markdownProviders();
}