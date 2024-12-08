import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/github/repo.dart';
import '../../domain/use_cases/get_repo.dart';
import '../home/home_viewmodel.dart';

class ProjectsController extends ChangeNotifier {
  final _homeController = Modular.get<HomeController>();
  final _getRepo = Modular.get<GetRepo>();

  List<Repo> listProjects = [];

  ProjectsController() {
    getGithubRepos();
  }

  void closeProjectsHome() {
    _homeController.closeProjects();
    notifyListeners();
  }

  void closeProjects() {
    Modular.to.pop();
    notifyListeners();
  }

  void setListProjects(List<Repo> list) {
    listProjects.clear();
    listProjects.addAll(list);
    notifyListeners();
  }

  Future<void> getGithubRepos() async {
    final result = await _getRepo();
    result.fold(
      (l) => AsukaSnackbar.alert(l.message),
      setListProjects,
    );
    notifyListeners();
  }
}
