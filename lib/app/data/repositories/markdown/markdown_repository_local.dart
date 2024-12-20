import 'package:flutter/services.dart';
import 'package:result_dart/result_dart.dart';

import 'markdown_repository.dart';

class MarkdownRepositoryLocal implements MarkdownRepository {
  @override
  AsyncResult<String> getMarkdown(String path) async {
    final data = await rootBundle.loadString(path);
    return AsyncResult.value(Success(data));
  }
}
