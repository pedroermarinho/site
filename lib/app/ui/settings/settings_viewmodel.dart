import 'dart:io';

import 'package:flutter/material.dart';
import '../../domain/use_cases/build_pdf.dart';
import '../../domain/view_models/themes_viewmodel.dart';
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

  void downloadPdf() async {
    final pdf = await buildPdf();
    final output = File("curriculo_pedro_marinho.pdf");
    await output.writeAsBytes(await pdf.save());
  }
}
