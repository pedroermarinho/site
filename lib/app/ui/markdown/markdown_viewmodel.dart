import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_viewmodel.dart';

class MarkdownController extends ChangeNotifier {
  final _homeController = Modular.get<HomeController>();

  void closeMarkdown() {
    _homeController.closeMarkdown();
    notifyListeners();
  }
}
