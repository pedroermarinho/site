import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final void Function(String)? onChanged;
  final bool obscureText;
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final TextStyle? labelStyle;

  const TextFieldCustom({
    Key? key,
    this.onChanged,
    this.obscureText = false,
    this.labelText = '',
    this.keyboardType = TextInputType.text,
    this.controller,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: Colors.blue,
          labelStyle: labelStyle ?? Theme.of(context).textTheme.bodyText1,
          labelText: labelText,
        ),
      );
}
