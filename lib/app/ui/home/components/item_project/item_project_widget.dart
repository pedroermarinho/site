import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../domain/entities/settings/projects.dart';
import '../../../../utils/launch_url.dart';
import '../../../markdown/markdown_page.dart';
import '../line/line_widget.dart';
import '../skills/skill_light_widget.dart';

class ItemProjectWidget extends StatelessWidget {
  final Projects projects;

  const ItemProjectWidget({required this.projects, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  projects.name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  width: 10,
                ),
                _projectType(projects),
                SizedBox(
                  width: 5,
                ),
                _status(projects.status),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                projects.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 5),
            Wrap(
              runSpacing: 5,
              spacing: 5,
              children: [
                ...projects.skills.map(
                  (skill) => SkillLightWidget(name: skill),
                )
              ],
            ),
            SizedBox(height: 5),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Visibility(
                  visible: projects.markdown != null,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 155),
                    child: TextButton(
                      onPressed: () => _openMD(context, projects.markdown!),
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.markdown),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Leia mais sobre"),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: projects.links?.site != null,
                  child: _url("Site", FontAwesomeIcons.link, projects.links?.site),
                ),
                Visibility(
                  visible: projects.links?.snap != null,
                  child: _url("Snap", FontAwesomeIcons.linux, projects.links?.snap),
                ),
                Visibility(
                  visible: projects.links?.github != null,
                  child: _url("GitHub", FontAwesomeIcons.github, projects.links?.github),
                ),
                Visibility(
                  visible: projects.links?.pypi != null,
                  child: _url("PyPi", FontAwesomeIcons.python, projects.links?.pypi),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: LineWidget(),
            ),
          ],
        ),
      );

  Widget _url(String title, IconData icon, String? url) => Container(
        constraints: BoxConstraints(maxWidth: 100),
        child: TextButton(
          onPressed: () => launchURL(url),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 10,
              ),
              Text("$title"),
            ],
          ),
        ),
      );

  Widget _projectType(Projects project) {
    switch (project.type) {
      case ProjectType.personal:
        return Tooltip(
          child: Icon(
            FontAwesomeIcons.user,
            size: 20,
          ),
          message: "Projeto Pessoal",
        );
      case ProjectType.professional:
        return Tooltip(
          child: Icon(
            FontAwesomeIcons.briefcase,
            size: 20,
          ),
          message: "Projeto Profissional",
        );
    }
  }

  Widget _status(ProjectStatus status){
    switch(status){
      case ProjectStatus.inProgress:
        return Tooltip(
          message: "O projeto se encontra em andamento e recebe atualizações",
          child: Icon(
            FontAwesomeIcons.gears,
            size: 20,
          ),
        );
      case ProjectStatus.completed:
        return Tooltip(
          message: "O projeto se encontra finalizado e não recebe atualizações",
          child: Icon(
            FontAwesomeIcons.check,
            size: 20,
          ),
        );
      case ProjectStatus.paused:
        return Tooltip(
          message: "O projeto se encontra pausado e não recebe atualizações",
          child: Icon(
            FontAwesomeIcons.pause,
            size: 20,
          ),
        );
      case ProjectStatus.archived:
        return Tooltip(
          message: "O projeto não foi finalizado e não recebe atualizações",
          child: Icon(
            FontAwesomeIcons.boxArchive,
            size: 20,
          ),
        );
    }
  }

  void _openMD(BuildContext context, String path) {
    MarkdownPage.openModal(pathMD: path);
  }
}
