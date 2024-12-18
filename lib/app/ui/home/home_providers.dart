import '../../config/providers.dart';
import 'home_viewmodel.dart';
import 'pages/container4/container4_viewmodel.dart';
import 'pages/container5/container5_viewmodel.dart';

void homeProviders() {
  getIt.registerLazySingleton(() => HomeViewModel(modalViewModel: getIt()));
  getIt.registerLazySingleton(() => Container4ViewModel(modalViewModel: getIt()));
  getIt.registerLazySingleton(() => Container5ViewModel(modalViewModel: getIt()));
}
