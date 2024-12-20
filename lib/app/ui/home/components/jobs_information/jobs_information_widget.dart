import 'package:flutter/material.dart';

import '../../../../domain/entities/settings/work_experience.dart';
import '../line/line_widget.dart';
import '../skills/skill_light_widget.dart';

class JobsInformationWidget extends StatelessWidget {
  final WorkExperience workExperience;

  const JobsInformationWidget({required this.workExperience});

  Widget current() => Container(
        padding: EdgeInsets.only(top: 1, bottom: 2, left: 5, right: 5),
        child: Text(
          "Atualmente",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(20)),
      );

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workExperience.companyName,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            ...workExperience.roles.map(
              (role) => Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      role.role,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(height: 8),
                    Text(
                      role.location,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Icon(Icons.date_range),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          role.startDate,
                          style: TextStyle(color: Colors.teal, fontSize: 16),
                        ),
                        Text(
                          " - ",
                          style: TextStyle(color: Colors.teal, fontSize: 16),
                        ),
                        role.endDate == null
                            ? current()
                            : Text(
                                role.endDate!,
                                style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 16,
                                ),
                              ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      runSpacing: 5,
                      spacing: 5,
                      children: [
                        ...role.skills.map(
                          (skill) => SkillLightWidget(name: skill),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Resumo",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  ...workExperience.details.map(
                    (detail) => Text(
                      "  - $detail",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: LineWidget(),
            ),
          ],
        ),
      );
}
