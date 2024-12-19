import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/github/github_repository.dart';
import '../data/repositories/github/github_repository_remote.dart';
import '../data/repositories/markdown/markdown_repository.dart';
import '../data/repositories/markdown/markdown_repository_local.dart';
import '../data/repositories/settings/settings_repository.dart';
import '../data/repositories/settings/settings_repository_local.dart';
import '../data/repositories/settings/settings_repository_remote.dart';
import '../data/repositories/theme/theme_repository.dart';
import '../data/repositories/theme/theme_repository_local.dart';
import '../data/services/storage_service.dart';
import '../data/services/storage_service_local.dart';
import '../domain/use_cases/build_pdf.dart';
import '../domain/use_cases/get_markdown.dart';
import '../domain/use_cases/get_repo.dart';
import '../domain/use_cases/get_settings.dart';
import '../domain/use_cases/get_theme.dart';
import '../domain/use_cases/get_user.dart';
import '../domain/use_cases/set_theme.dart';
import '../domain/view_models/data_viewmodel.dart';
import '../domain/view_models/modal_viewmodel.dart';
import '../domain/view_models/themes_viewmodel.dart';
import '../ui/home/home_providers.dart';
import '../ui/markdown/markdown_providers.dart';
import '../ui/projects/projects_providers.dart';
import '../ui/settings/settings_providers.dart';
import '../ui/shared/components/loading_dialog.dart';
import '../ui/shared/components/success_dialog.dart';
import '../ui/shared/pages/about/about_viewmodel.dart';
import '../ui/shared/pages/splash_screen/splash_screen_viewmodel.dart';
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
  getIt.registerLazySingleton<DataViewModel>(DataViewModelImpl.new);
  if (isProduction) {
    getIt.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryRemote(dio: getIt()));
  } else {
    getIt.registerLazySingleton<SettingsRepository>(SettingsRepositoryLocal.new);
  }
  getIt.registerLazySingleton<GetSettings>(() => GetSettingsImpl(getIt()));
  getIt.registerLazySingleton<GitHubRepository>(() => GithubRepositoryRemote(dio: getIt()));
  getIt.registerLazySingleton<GetRepo>(() => GetRepoImpl(getIt()));
  getIt.registerLazySingleton<GetUser>(() => GetUserImpl(getIt()));
  getIt.registerLazySingleton<SplashScreenViewModel>(() => SplashScreenViewModel(
        dataViewModel: getIt(),
        getSettings: getIt(),
      ));
  getIt.registerLazySingleton<ModalViewModel>(ModalViewModel.new);
  getIt.registerLazySingleton<MarkdownRepository>(MarkdownRepositoryLocal.new);
  getIt.registerLazySingleton<GetMarkdown>(() => GetMarkdownImpl(repository: getIt()));
  getIt.registerLazySingleton<AboutViewModel>(() => AboutViewModel(getMarkdown: getIt()));
  getIt.registerLazySingleton(() => BuildPdf(dataViewModel: getIt()));
  homeProviders();
  projectsProviders();
  settingsProviders();
  markdownProviders();
}
