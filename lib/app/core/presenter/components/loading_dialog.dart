import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

abstract class LoadingDialog {
  void show();
  Future<void> hide();
}

class LoadingDialogImpl implements LoadingDialog {
  late OverlayEntry _entry;

  LoadingDialogImpl() {
    _entry = OverlayEntry(
      builder: (context) => Container(
        color: Colors.black.withOpacity(.3),
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Future<void> hide() async {
    _entry.remove();
    await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  void show() {
    FocusManager.instance.primaryFocus!.unfocus();
    asuka.addOverlay(_entry);
  }
}
