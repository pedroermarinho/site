import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../domain/view_models/data_viewmodel.dart';
import '../../../../ui/shared/components/responsive_widget.dart';
import '../../../shared/components/generic_container.dart';
import '../../components/item_project/item_project_widget.dart';
import '../../components/text_icon/text_icon_widget.dart';
import 'personal_project_viewmodel.dart';

class PersonalProjectPage extends StatefulWidget {
  final PersonalProjectViewModel personalProjectViewModel;
  final DataViewModel dataViewModel;

  const PersonalProjectPage({required this.personalProjectViewModel, required this.dataViewModel, super.key});

  @override
  _PersonalProjectPageState createState() => _PersonalProjectPageState();
}

class _PersonalProjectPageState extends State<PersonalProjectPage> {
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
          SizedBox(height: 20),
          ...settings.projects.map((e) => ItemProjectWidget(projects: e)),
          ResponsiveWidget.isSmallScreen(context)
              ? Center(
                  child: TextButton(
                    onPressed: widget.personalProjectViewModel.pushProjects,
                    child: Text("Mais Projetos"),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}