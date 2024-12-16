import '../../config/providers.dart';
import 'projects_viewmodel.dart';

void projectsProviders() {
  getIt.registerLazySingleton(
    () => ProjectsViewModel(
      getRepo: getIt(),
      modalViewModel: getIt(),
    ),
  );
}
