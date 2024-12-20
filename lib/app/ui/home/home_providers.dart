import '../../config/providers.dart';
import 'home_viewmodel.dart';
import 'pages/personal_information/personal_information_viewmodel.dart';
import 'pages/personal_project/personal_project_viewmodel.dart';
import 'pages/social_links/social_links_viewmodel.dart';

void homeProviders() {
  getIt.registerLazySingleton(() => HomeViewModel(modalViewModel: getIt()));
  getIt.registerLazySingleton(() => PersonalProjectViewModel(modalViewModel: getIt()));
  getIt.registerLazySingleton(() => SocialLinksViewModel(modalViewModel: getIt()));
  getIt.registerLazySingleton(() => PersonalInformationViewModel(buildPdf: getIt()));
}
