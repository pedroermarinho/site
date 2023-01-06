import 'package:asuka/asuka.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/domain/entities/github/repo.dart';
import '../../core/domain/usercases/get_repo.dart';
import '../home/home_controller.dart';

part 'projects_controller.g.dart';

class ProjectsController = _ProjectsControllerBase with _$ProjectsController;

abstract class _ProjectsControllerBase with Store {
  final _homeController = Modular.get<HomeController>();
  final _getRepo = Modular.get<GetRepo>();

  @action
  void closeProjectsHome() {
    _homeController.closeProjects();
  }

  @action
  void closeProjects() {
    Modular.to.pop();
  }

  @observable
  ObservableList<Repo> listProjects = ObservableList();

  @action
  void setListProjects(List<Repo> list) {
    listProjects.clear();
    listProjects.addAll(list.asObservable());
  }

  _ProjectsControllerBase() {
    getGithubRepos();
  }

  @action
  Future<void> getGithubRepos() async {
    final result = await _getRepo();
    result.fold(
      (l) => AsukaSnackbar.alert(l.message),
      setListProjects,
    );
  }
}
