import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../domain/entities/settings/projects.dart';
import '../line/line_widget.dart';

class ItemProjectWidget extends StatelessWidget {
  final Projects projects;

  const ItemProjectWidget({Key? key, required this.projects}) : super(key: key);

  _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  Widget url(String title, IconData icon, String? url) => Container(
        constraints: BoxConstraints(maxWidth: 130),
        child: TextButton(
          onPressed: () => url != null ? _launchURL(url) : null,
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

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _launchURL(projects.url),
              child: Text(
                projects.name,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Visibility(
                  visible: projects.snap != null,
                  child: url("Snap", FontAwesomeIcons.linux, projects.snap),
                ),
                Visibility(
                  visible: projects.github != null,
                  child: url("GitHub", FontAwesomeIcons.python, projects.github),
                ),
                Visibility(
                  visible: projects.pypi != null,
                  child: url("PyPi", FontAwesomeIcons.python, projects.pypi),
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
}
