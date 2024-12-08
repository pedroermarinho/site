import 'package:flutter/material.dart';

import '../../../domain/entities/settings/settings.dart';

class LoadingSettingsData extends StatelessWidget {
  final Settings? data;
  final Widget Function(Settings) builder;

  const LoadingSettingsData({
    required this.data,
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => data == null ? const Center(child: CircularProgressIndicator()) : builder(data!);
}
