import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget? smallScreen;
  final Widget? mediumScreen;
  final Widget? largeScreen;

  static bool isSmallScreen(BuildContext context) => MediaQuery.of(context).size.width < 765;

  static bool isMediumScreen(BuildContext context) => MediaQuery.of(context).size.width < 1000 && MediaQuery.of(context).size.width >= 765;

  static bool isLargeScreen(BuildContext context) => MediaQuery.of(context).size.width >= 1000 || isMediumScreen(context);

  static Widget listViewOrColumn(
    BuildContext context, {
    required List<Widget> children,
  }) =>
      isSmallScreen(context)
          ? ListView(
              children: children,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            );

  const ResponsiveWidget({
    this.smallScreen,
    this.mediumScreen,
    this.largeScreen,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1000) {
            return largeScreen ?? mediumScreen ?? smallScreen!;
          } else if (constraints.maxWidth < 1000 && constraints.maxWidth >= 765) {
            return mediumScreen ?? largeScreen ?? smallScreen!;
          } else {
            return smallScreen ?? largeScreen!;
          }
        },
      );
}
