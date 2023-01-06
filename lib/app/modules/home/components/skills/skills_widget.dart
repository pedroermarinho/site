import 'package:flutter/material.dart';

import '../../../../core/domain/entities/settings/skills.dart';

class SkillsWidget extends StatelessWidget {
  final Skills skills;

  const SkillsWidget({Key? key, required this.skills}) : super(key: key);

  Color get _color {
    switch (getCodeSkill(skills.level)) {
      case 1:
        return Colors.greenAccent;
      case 2:
        return Colors.lightGreen;
      default:
        return Colors.green;
    }
  }

  int getCodeSkill(String text) {
    switch (text) {
      case "basic":
        return 1;
      case "intermediary":
        return 2;
      case "advanced":
        return 3;
      case "native":
        return 3;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints(minWidth: 30, maxWidth: 200),
        child: Text(
          "${skills.name}",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(15),
        ),
      );
}
