import 'package:flutter/material.dart';

class TextIconWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextStyle? style;
  final double? sizeIcon;

  const TextIconWidget({
    required this.text,
    this.icon = Icons.star,
    this.style,
    this.sizeIcon,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: sizeIcon,
          ),
          SizedBox(
            width: 15,
          ),
          Flexible(
            child: Text(
              "$text",
              style: style,
            ),
          )
        ],
      );
}
