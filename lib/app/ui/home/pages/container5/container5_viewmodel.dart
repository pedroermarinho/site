import '../../../../config/providers.dart';
import '../../../../domain/view_models/modal_viewmodel.dart';
import '../../../projects/projects_page.dart';
import '../../../shared/pages/about/about_page.dart';

class Container5ViewModel {
  final ModalViewModel modalViewModel;

  Container5ViewModel({required this.modalViewModel});

  void openAbout() {
    modalViewModel.openModal(
      AboutPage(
        aboutViewModel: getIt(),
        modalViewModel: getIt(),
      ),
    );
  }
}
