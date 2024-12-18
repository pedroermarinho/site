import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../config/assets_path.dart';
import '../../../../domain/use_cases/get_markdown.dart';

class AboutViewModel extends ChangeNotifier {
  final GetMarkdown getMarkdown;
  late final Command0<String> getAboutCommand;
  late final Command0<String> getVersionCommand;

  AboutViewModel({required this.getMarkdown}) {
    getAboutCommand = Command0<String>(() async {
      final result = await getMarkdown.call(AssetsPath.aboutMD);
      return result;
    });
    getAboutCommand.execute();

    getVersionCommand = Command0<String>(() async {
      final result = await PackageInfo.fromPlatform();
      return Success(result.version);
    });
    getVersionCommand.execute();
  }
}
