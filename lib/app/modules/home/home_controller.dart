import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/presenter/pages/about/about_page.dart';
import '../projetcs/projects_module.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store implements Disposable {
  @observable
  Widget projects = Container();

  @action
  void openProjects() {
    projects = ProjectsModule();
  }

  @action
  void closeProjects() {
    projects = Container();
  }

  @observable
  Widget about = Container();

  @action
  void openAbout() {
    about = AboutPage();
  }

  @action
  void closeAbout() {
    about = Container();
  }

  final pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();
  }
}
