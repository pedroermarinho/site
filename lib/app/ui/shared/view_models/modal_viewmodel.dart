import 'package:flutter/material.dart';

class ModalViewModel extends ChangeNotifier {
  Widget modal = Container();

  void openModal(Widget modalWidget) {
    modal = modalWidget;
    notifyListeners();
  }

  void closeModal() {
    modal = Container();
    notifyListeners();
  }
}
