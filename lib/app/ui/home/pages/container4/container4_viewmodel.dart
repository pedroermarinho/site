import '../../../../config/providers.dart';
import '../../../../domain/view_models/modal_viewmodel.dart';
import '../../../projects/projects_page.dart';

class Container4ViewModel {
  final ModalViewModel modalViewModel;

  Container4ViewModel({required this.modalViewModel});

  void pushProjects() {
    modalViewModel.openModal(
      ProjectsPage(
        projectsViewModel: getIt(),
      ),
    );
  }
}
