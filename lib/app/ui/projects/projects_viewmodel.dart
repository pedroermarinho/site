import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/github/repo.dart';
import '../../domain/errors/generic_errors.dart';
import '../../domain/use_cases/get_repo.dart';
import '../../domain/view_models/modal_viewmodel.dart';

class ProjectsViewModel extends ChangeNotifier {
  final ModalViewModel modalViewModel;
  final GetRepo getRepo;

  List<Repo> listProjects = [];

  ProjectsViewModel({required this.modalViewModel, required this.getRepo}) {
    getGithubRepos();
  }

  void closeProjects() {
    modalViewModel.closeModal();
    notifyListeners();
  }

  void setListProjects(List<Repo> list) {
    listProjects.clear();
    listProjects.addAll(list);
    notifyListeners();
  }

  Future<void> getGithubRepos() async {
    final result = await getRepo();
    result.fold(
      setListProjects,
      _errorGithubRepos,
    );
    notifyListeners();
  }

  void _errorGithubRepos(Exception e) {
    if (e is GenericFailure) {
      AsukaSnackbar.alert(e.message).show();
    } else {
      AsukaSnackbar.alert("Erro ao recuperar repositórios").show();
    }
  }
}
