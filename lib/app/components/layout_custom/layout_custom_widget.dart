import 'package:flutter/material.dart';

class LayoutCustomWidget extends StatelessWidget {
  final AppBar appBar;
  final Widget body;

  const LayoutCustomWidget({Key key, this.appBar, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}