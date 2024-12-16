import 'package:result_dart/result_dart.dart';

abstract class MarkdownRepository {
  AsyncResult<String> getMarkdown(String path);

  AsyncResult<List<String>> getMarkdownList();
}
