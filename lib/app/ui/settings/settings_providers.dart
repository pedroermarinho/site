import '../../config/providers.dart';
import 'settings_viewmodel.dart';

void settingsProviders() {
  getIt.registerLazySingleton(() => SettingsViewModel(
        homeViewModel: getIt(),
        themesController: getIt(),
        buildPdf: getIt(),
      ));
}
