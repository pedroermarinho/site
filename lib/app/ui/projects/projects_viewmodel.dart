import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/github/repo.dart';
import '../../domain/use_cases/get_repo.dart';
import '../shared/view_models/modal_viewmodel.dart';

class ProjectsViewModel extends ChangeNotifier {
  final ModalViewModel modalViewModel;
  final GetRepo getRepo;

  List<Repo> listProjects = [];

  ProjectsViewModel({required this.modalViewModel, required this.getRepo}) {
    getGithubRepos();
  }

  void closeProjectsHome() {
    modalViewModel.closeModal();
    notifyListeners();
  }

  void closeProjects(BuildContext context) {
    Navigator.pop(context);
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
      (l) => AsukaSnackbar.alert(l.toString()),
    );
    notifyListeners();
  }
}
