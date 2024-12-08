import 'package:flutter/cupertino.dart';

import '../../ui/shared/pages/about/about_page.dart';
import '../projects/projects_module.dart';

class HomeController extends ChangeNotifier {
  Widget projects = Container();

  void openProjects() {
    projects = ProjectsModule();
    notifyListeners();
  }

  void closeProjects() {
    projects = Container();
    notifyListeners();
  }

  Widget about = Container();

  void openAbout() {
    about = AboutPage();
    notifyListeners();
  }

  void closeAbout() {
    about = Container();
    notifyListeners();
  }

  final pageViewController = PageController();
}
