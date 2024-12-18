import 'package:flutter/cupertino.dart';

import '../../config/providers.dart';
import '../../domain/view_models/modal_viewmodel.dart';
import '../../ui/shared/pages/about/about_page.dart';
import '../projects/projects_page.dart';

class HomeViewModel {
  final ModalViewModel modalViewModel;

  HomeViewModel({required this.modalViewModel});

  void openProjects() {
    modalViewModel.openModal(ProjectsPage(projectsViewModel: getIt()));
  }

  void closeModal() {
    modalViewModel.closeModal();
  }

  void openAbout() {
    modalViewModel.openModal(AboutPage(
      modalViewModel: getIt(),
      aboutViewModel: getIt(),
    ));
  }

  final pageViewController = PageController();
}
