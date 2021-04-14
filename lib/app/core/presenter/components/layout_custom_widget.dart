import 'package:flutter/material.dart';

class LayoutCustomWidget extends StatelessWidget {
  final AppBar appBar;
  final Widget body;

  const LayoutCustomWidget({required this.appBar, required this.body});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: appBar, body: body);
}
