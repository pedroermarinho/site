import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../domain/view_models/data_viewmodel.dart';
import '../../../../ui/shared/components/responsive_widget.dart';
import '../../../shared/components/generic_container.dart';
import '../../components/text_icon/text_icon_widget.dart';

class PersonalSummaryPage extends StatefulWidget {
  final DataViewModel dataViewModel;

  const PersonalSummaryPage({required this.dataViewModel, super.key});

  @override
  _PersonalSummaryPageState createState() => _PersonalSummaryPageState();
}

class _PersonalSummaryPageState extends State<PersonalSummaryPage> {
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
            text: "Resumo",
            icon: FontAwesomeIcons.userAstronaut,
            sizeIcon: 40,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(height: 20),
          Text(
            settings.summary,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
