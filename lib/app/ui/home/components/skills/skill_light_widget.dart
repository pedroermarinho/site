import 'package:flutter/material.dart';

class SkillLightWidget extends StatelessWidget {
  final String name;

  const SkillLightWidget({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints(minWidth: 20),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 12,
          ),
        ),
        padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(15),
        ),
      );
}
