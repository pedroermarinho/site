import '../../../../ui/home/home_viewmodel.dart';

class AboutController {
  final HomeController homeController;

  AboutController({required this.homeController});

  void closeAbout() {
    homeController.closeAbout();
  }
}
