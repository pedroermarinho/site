import 'package:flutter/material.dart';

import '../../../../domain/view_models/data_viewmodel.dart';
import '../../../../ui/shared/components/responsive_widget.dart';
import '../../../shared/components/generic_container.dart';
import '../../components/academic_information/academic_information_widget.dart';
import '../../components/text_icon/text_icon_widget.dart';

class Container3Page extends StatefulWidget {
  final DataViewModel dataViewModel;

  const Container3Page({required this.dataViewModel, super.key});

  @override
  _Container3PageState createState() => _Container3PageState();
}

class _Container3PageState extends State<Container3Page> {
  void update() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.dataViewModel.addListener(update);
  }

  @override
  void dispose() {
    widget.dataViewModel.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = widget.dataViewModel.settings;
    return GenericContainer(
      child: ResponsiveWidget.listViewOrColumn(
        context,
        children: [
          TextIconWidget(
            text: "Educação",
            icon: Icons.school,
            sizeIcon: 40,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 55),
          ...settings.academic.map(
            (academic) => AcademicInformationWidget(academic: academic),
          ),
        ],
      ),
    );
  }
}
