import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'projetcs_controller.dart';

class ProjetcsPage extends StatefulWidget {
  final String title;

  const ProjetcsPage({Key key, this.title = "Projetcs"}) : super(key: key);

  @override
  _ProjetcsPageState createState() => _ProjetcsPageState();
}

class _ProjetcsPageState
    extends ModularState<ProjetcsPage, ProjetcsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
