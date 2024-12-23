import 'package:flutter/material.dart';

import '../../ui/shared/components/responsive_widget.dart';
import 'components/project_component_widget.dart';
import 'projects_viewmodel.dart';

class ProjectsPage extends StatefulWidget {
  final ProjectsViewModel projectsViewModel;

  const ProjectsPage({required this.projectsViewModel, super.key});

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  void update() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.projectsViewModel.addListener(update);
  }

  @override
  void dispose() {
    widget.projectsViewModel.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(ResponsiveWidget.isSmallScreen(context) ? 0 : 70),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: widget.projectsViewModel.closeProjects,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 15, top: 6),
                  itemCount: widget.projectsViewModel.listProjects.length,
                  itemBuilder: (_, index) => ProjectComponentWidget(
                    repo: widget.projectsViewModel.listProjects.elementAt(index),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
