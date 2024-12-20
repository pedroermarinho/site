import 'package:flutter/material.dart';

import '../../domain/use_cases/build_pdf.dart';
import '../../domain/view_models/themes_viewmodel.dart';
import '../../utils/download_pdf.dart';
import '../home/home_viewmodel.dart';

class SettingsViewModel extends ChangeNotifier {
  final ThemesViewModel themesController;
  final HomeViewModel homeViewModel;
  final BuildPdf buildPdf;

  SettingsViewModel({required this.themesController, required this.homeViewModel, required this.buildPdf});

  bool get isThemeDark => themesController.isDark;

  void changeTheme() {
    themesController.changeTheme();
    notifyListeners();
  }

  void openProjects() {
    homeViewModel.openProjects();
    notifyListeners();
  }

  void openAbout() {
    homeViewModel.openAbout();
    notifyListeners();
  }

  void downloadPdfFile() async {
    final pdf = await buildPdf();
    final pdfBytes = await pdf.save();
    await downloadPdf(pdfBytes, "curriculo_pedro_marinho.pdf");
  }
}
