import 'dart:io';

import 'markdown_repository.dart';

class MarkdownRepositoryLocal implements MarkdownRepository {
  @override
  Future<String> getMarkdown(String path) {
    final file = File(path);
    return file.readAsString();
  }

  @override
  Future<List<String>> getMarkdownList() {
    final directory = Directory('assets/markdown');
    final files = directory.listSync();
    return Future.value(files.map((file) => file.path).toList());
  }
}
