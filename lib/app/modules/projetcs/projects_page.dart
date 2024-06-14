import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/presenter/components/project_component_widget.dart';
import '../../core/presenter/components/responsive_widget.dart';
import 'projects_controller.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final controller = Modular.get<ProjectsController>();

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        grandeScreen: Padding(
          padding: EdgeInsets.all(70),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).textTheme.headlineSmall!.color,
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
                      onPressed: controller.closeProjectsHome,
                    ),
                  ],
                ),
                Observer(
                  builder: (_) => Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 15, top: 6),
                      itemCount: controller.listProjects.length,
                      itemBuilder: (_, index) => ProjectComponentWidget(
                        repo: controller.listProjects.elementAt(index),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        pequenoScreen: Scaffold(
          body: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: controller.closeProjects,
                    ),
                  ],
                ),
                Observer(
                  builder: (_) => Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 15, top: 6),
                      itemCount: controller.listProjects.length,
                      itemBuilder: (_, index) => ProjectComponentWidget(
                        repo: controller.listProjects.elementAt(index),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
