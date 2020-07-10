import 'package:flutter/material.dart';

class TextIconWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextStyle style;

  const TextIconWidget({
    Key key,
    @required this.text,
    this.icon = Icons.star,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(
          width: 15,
        ),
        Text(
          "$text",
          style: style,
        ),
      ],
    );
  }
}
