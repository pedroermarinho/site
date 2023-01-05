import 'package:flutter/material.dart';

import '../../../../core/domain/entities/settings/academic.dart';
import '../line/line_widget.dart';

class AcademicInformationWidget extends StatelessWidget {
  final Academic academic;

  const AcademicInformationWidget({required this.academic});

  Widget current() => Container(
        padding: EdgeInsets.only(top: 1, bottom: 2, left: 5, right: 5),
        child: Text(
          "Atualmente",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(20),
        ),
      );

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              academic.course,
              style: Theme.of(context).textTheme.headline2,
            ),
            Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      academic.institution,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(height: 8),
                    Text(
                      academic.type,
                      style: Theme.of(context).textTheme.bodyText1,
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
                          academic.startDate,
                          style: TextStyle(color: Colors.teal, fontSize: 16),
                        ),
                        Text(
                          " - ",
                          style: TextStyle(color: Colors.teal, fontSize: 16),
                        ),
                        academic.endDate == null
                            ? current()
                            : Text(
                                academic.endDate!,
                                style:
                                    TextStyle(color: Colors.teal, fontSize: 16),
                              ),
                      ],
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: LineWidget(),
            ),
          ],
        ),
      );
}
