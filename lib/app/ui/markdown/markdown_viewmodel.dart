import 'package:flutter/cupertino.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/use_cases/get_markdown.dart';

class MarkdownViewModel extends ChangeNotifier {
  final GetMarkdown getMarkdown;
  Command0<String> getMarkdownCommand = Command0<String>(() => Future.value(Success("")));

  MarkdownViewModel({required this.getMarkdown});

  void loadMD(String path) {
    getMarkdownCommand = Command0<String>(() async {
      final result = await getMarkdown.call(path);
      return result;
    });
    getMarkdownCommand.execute();
  }
}
