import 'package:result_dart/result_dart.dart';

import '../../data/repositories/markdown/markdown_repository.dart';

abstract class GetMarkdown {
  AsyncResult<String> call(String path);
}

class GetMarkdownImpl implements GetMarkdown {
  final MarkdownRepository repository;

  GetMarkdownImpl({
    required this.repository,
  });

  @override
  AsyncResult<String> call(String path) async => await repository.getMarkdown(path);
}
