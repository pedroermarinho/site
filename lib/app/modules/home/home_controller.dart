import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:site/app/modules/projetcs/projetcs_module.dart';
import 'package:site/app/pages/about/about_page.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  Widget projects = Container();

  @action
  void openProjects(){
    projects = ProjetcsModule();
  }
  @action
  void closeProjects(){
    projects = Container();
  }

  @observable
  Widget about = Container();

  @action
  void openAbout(){
    about = AboutPage();
  }
  @action
  void closeAbout(){
    about = Container();
  }

}
