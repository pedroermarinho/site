import 'package:flutter/material.dart';

import '../../../../core/domain/entities/settings/jobs.dart';
import '../line/line_widget.dart';

class JobsInformationWidget extends StatelessWidget {
  final Jobs jobs;

  const JobsInformationWidget({required this.jobs});

  Widget current() => Container(
        padding: EdgeInsets.only(top: 1, bottom: 2, left: 5, right: 5),
        child: Text(
          "Atualmente",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        decoration: BoxDecoration(
            color: Colors.teal, borderRadius: BorderRadius.circular(20)),
      );

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              jobs.companyName,
              style: Theme.of(context).textTheme.headline2,
            ),
            ...jobs.roles.map(
              (role) => Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      role.role,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(height: 8),
                    Text(
                      role.location,
                      style: Theme.of(context).textTheme.headline4,
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
                          (skill) => Container(
                            constraints: BoxConstraints(minWidth: 20),
                            child: Text(
                              skill,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                              ),
                            ),
                            padding: EdgeInsets.only(
                                top: 4, bottom: 4, left: 8, right: 8),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
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
