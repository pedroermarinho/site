import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../domain/view_models/data_viewmodel.dart';
import '../../../../ui/shared/components/responsive_widget.dart';
import '../../../shared/components/generic_container.dart';
import '../../components/item_project/item_project_widget.dart';
import '../../components/text_icon/text_icon_widget.dart';
import 'container4_viewmodel.dart';

class Container4Page extends StatefulWidget {
  final Container4ViewModel container4ViewModel;
  final DataViewModel dataViewModel;

  const Container4Page({required this.container4ViewModel, required this.dataViewModel, super.key});

  @override
  _Container4PageState createState() => _Container4PageState();
}

class _Container4PageState extends State<Container4Page> {
  void update() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.dataViewModel.addListener(update);
  }

  @override
  void dispose() {
    widget.dataViewModel.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = widget.dataViewModel.settings;
    return GenericContainer(
      child: ResponsiveWidget.listViewOrColumn(
        context,
        children: [
          TextIconWidget(
            text: "Projetos",
            icon: FontAwesomeIcons.github,
            sizeIcon: 40,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 55),
          ...settings.projects.map((e) => ItemProjectWidget(projects: e)),
          ResponsiveWidget.isSmallScreen(context)
              ? Center(
                  child: TextButton(
                    onPressed: widget.container4ViewModel.pushProjects,
                    child: Text("Mais Projetos"),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
