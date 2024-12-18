import 'package:flutter/material.dart';

import 'responsive_widget.dart';

class GenericContainer extends StatelessWidget {
  final Widget child;

  const GenericContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: ResponsiveWidget.isSmallScreen(context)
            ? EdgeInsets.only(
                bottom: 0,
                left: 6,
                right: 0,
                top: 6,
              )
            : EdgeInsets.all(6),
        child: Container(
          decoration: ResponsiveWidget.isSmallScreen(context)
              ? null
              : BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6.0,
                    ),
                  ],
                ),
          child: Padding(
            padding: ResponsiveWidget.isSmallScreen(context)
                ? EdgeInsets.only(
                    bottom: 0,
                    left: 10,
                    right: 0,
                    top: 10,
                  )
                : EdgeInsets.all(30),
            child: child,
          ),
        ),
      );
}
