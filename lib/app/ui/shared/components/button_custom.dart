import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final void Function()? onPressed;
  final String labelText;

  final double? width;
  final double height;
  final Color? color;

  const ButtonCustom({
    Key? key,
    this.width,
    this.height = 60,
    this.onPressed,
    this.labelText = '',
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            // padding: EdgeInsets.only(left: 5, right: 5),
            width: width,
            height: height,
            child: Center(
              child: Text(
                labelText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: onPressed != null ? color ?? Theme.of(context).colorScheme.secondary : Colors.grey,
            ),
          ),
        ),
      );
}
