import 'package:flutter/cupertino.dart';

import '../../config/providers.dart';
import '../../ui/shared/pages/about/about_page.dart';
import '../markdown/markdown_page.dart';
import '../projects/projects_page.dart';
import '../shared/view_models/modal_viewmodel.dart';

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
    modalViewModel.openModal(AboutPage(modalViewModel: getIt()));
  }

  void openMarkdown() {
    modalViewModel.openModal(MarkdownPage(modalViewModel: getIt()));
  }

  final pageViewController = PageController();
}
