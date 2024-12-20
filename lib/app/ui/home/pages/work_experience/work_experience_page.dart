import 'package:flutter/material.dart';

import '../../../../domain/view_models/data_viewmodel.dart';
import '../../../../ui/shared/components/responsive_widget.dart';
import '../../../shared/components/generic_container.dart';
import '../../components/jobs_information/jobs_information_widget.dart';
import '../../components/text_icon/text_icon_widget.dart';

class WorkExperiencePage extends StatefulWidget {
  final DataViewModel dataViewModel;

  const WorkExperiencePage({required this.dataViewModel, super.key});

  @override
  _WorkExperiencePageState createState() => _WorkExperiencePageState();
}

class _WorkExperiencePageState extends State<WorkExperiencePage> {
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
            text: "Experiência de Trabalho",
            icon: Icons.business,
            sizeIcon: 40,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 20),
          ...settings.workExperience.map((workExperience) => JobsInformationWidget(workExperience: workExperience)),
        ],
      ),
    );
  }
}
