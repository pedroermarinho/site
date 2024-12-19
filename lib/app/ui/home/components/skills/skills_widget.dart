import 'package:flutter/material.dart';

class SkillsWidget extends StatelessWidget {
  final String name;
  final bool isPrimary;

  const SkillsWidget({required this.name, required this.isPrimary, Key? key}) : super(key: key);

  Color get _color => isPrimary ? Colors.lightGreen : Colors.greenAccent;

  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints(minWidth: 30, maxWidth: 200),
        child: Text(
          "$name",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[850],
            fontWeight: FontWeight.w600,
          ),
        ),
        padding: EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(15),
        ),
      );
}
