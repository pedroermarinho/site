import 'dart:io';

import 'package:result_dart/result_dart.dart';

import 'markdown_repository.dart';

class MarkdownRepositoryLocal implements MarkdownRepository {
  @override
  AsyncResult<String> getMarkdown(String path)async {
    final file = File(path);
    if (!file.existsSync()) {
      return AsyncResult.error('Arquivo não encontrado');
    }
    final content = await file.readAsString();
    return AsyncResult.value(Success(content));
  }

  @override
  AsyncResult<List<String>> getMarkdownList() async{
    final directory = Directory('assets/markdown');
    if (!directory.existsSync()) {
      return AsyncResult.error('Diretório não encontrado');
    }
    final files = directory.listSync();
    final data = await Future.value(files.map((file) => file.path).toList());
    return AsyncResult.value(Success(data));
  }
}
