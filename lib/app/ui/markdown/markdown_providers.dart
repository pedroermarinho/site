import '../../config/providers.dart';
import 'markdown_viewmodel.dart';

void markdownProviders() {
  getIt.registerLazySingleton(() => MarkdownViewModel(
        getMarkdown: getIt(),
      ));
}
