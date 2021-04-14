import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget? pequenoScreen;
  final Widget? medioScreen;
  final Widget? grandeScreen;

  static bool isPequenoScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < 765;

  static bool isMedioScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000 &&
      MediaQuery.of(context).size.width >= 765;

  static bool isGrandeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000 || isMedioScreen(context);

  static Widget listViewOrColumn(
    BuildContext context, {
    required List<Widget> children,
  }) =>
      isPequenoScreen(context)
          ? ListView(
              children: children,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            );

  const ResponsiveWidget({
    this.pequenoScreen,
    this.medioScreen,
    this.grandeScreen,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1000) {
            return grandeScreen ?? medioScreen ?? pequenoScreen!;
          } else if (constraints.maxWidth < 1000 &&
              constraints.maxWidth >= 765) {
            return medioScreen ?? grandeScreen ?? pequenoScreen!;
          } else {
            return pequenoScreen ?? grandeScreen!;
          }
        },
      );
}
