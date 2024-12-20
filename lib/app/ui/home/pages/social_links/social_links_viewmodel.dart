import '../../../../config/providers.dart';
import '../../../../domain/view_models/modal_viewmodel.dart';
import '../../../shared/pages/about/about_page.dart';

class SocialLinksViewModel {
  final ModalViewModel modalViewModel;

  SocialLinksViewModel({required this.modalViewModel});

  void openAbout() {
    modalViewModel.openModal(
      AboutPage(
        aboutViewModel: getIt(),
        modalViewModel: getIt(),
      ),
    );
  }
}
