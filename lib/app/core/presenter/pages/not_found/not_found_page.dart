import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Center(
            child: Text("Pagina não encontrada"),
          ),
        ),
      );
}
