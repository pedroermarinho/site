import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

abstract class SuccessDialog {
  void show();
  Future<void> hide();
}

class SuccessDialogImpl implements SuccessDialog {
  late OverlayEntry _entry;

  SuccessDialogImpl() {
    _entry = OverlayEntry(
      builder: (context) => Container(
        color: Colors.white.withOpacity(.9),
        alignment: Alignment.center,
        child: Center(
          child: Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 300,
          ),
        ),
      ),
    );
  }

  @override
  Future<void> hide() async {
    _entry.remove();
    await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  void show() async {
    FocusManager.instance.primaryFocus!.unfocus();
    asuka.addOverlay(_entry);
    await Future.delayed(Duration(seconds: 3));
    hide();
  }
}
