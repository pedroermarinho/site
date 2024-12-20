import '../../../../config/providers.dart';
import '../../../../domain/view_models/modal_viewmodel.dart';
import '../../../projects/projects_page.dart';

class PersonalProjectViewModel {
  final ModalViewModel modalViewModel;

  PersonalProjectViewModel({required this.modalViewModel});

  void pushProjects() {
    modalViewModel.openModal(
      ProjectsPage(
        projectsViewModel: getIt(),
      ),
    );
  }
}
