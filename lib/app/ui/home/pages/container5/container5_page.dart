import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../domain/view_models/data_viewmodel.dart';
import '../../../../ui/shared/components/responsive_widget.dart';
import '../../../../utils/launch_url.dart';
import '../../../shared/components/generic_container.dart';
import '../../components/line/line_widget.dart';
import 'container5_viewmodel.dart';

class Container5Page extends StatefulWidget {
  final DataViewModel dataViewModel;
  final Container5ViewModel viewModel;

  const Container5Page({required this.dataViewModel, required this.viewModel, super.key});

  @override
  _Container5PageState createState() => _Container5PageState();
}

class _Container5PageState extends State<Container5Page> {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              Tooltip(
                message: "Github",
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.squareGithub),
                  onPressed: () => launchURL('https://github.com/${settings.socialLinks.github}'),
                  iconSize: 100,
                ),
              ),
              Visibility(
                visible: settings.socialLinks.instagram != null,
                child: Tooltip(
                  message: "Instagram",
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.squareInstagram),
                    onPressed: () => launchURL('https://instagram.com/${settings.socialLinks.instagram}'),
                    iconSize: 100,
                  ),
                ),
              ),
              Visibility(
                visible: settings.socialLinks.linkedin != null,
                child: Tooltip(
                  message: "Linkedin",
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.linkedin),
                    onPressed: () => launchURL('https://linkedin.com/in/${settings.socialLinks.linkedin}'),
                    iconSize: 100,
                  ),
                ),
              ),
              Visibility(
                visible: settings.socialLinks.youtube != null,
                child: Tooltip(
                  message: "Youtube",
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.squareYoutube),
                    onPressed: () => launchURL('https://youtube.com/${settings.socialLinks.youtube}'),
                    iconSize: 100,
                  ),
                ),
              ),
              Visibility(
                visible: settings.socialLinks.twitter != null,
                child: Tooltip(
                  message: "Twitter",
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.squareTwitter),
                    onPressed: () => launchURL('https://twitter.com/${settings.socialLinks.twitter}'),
                    iconSize: 100,
                  ),
                ),
              ),
              Visibility(
                visible: settings.socialLinks.facebook != null,
                child: Tooltip(
                  message: 'Facebook',
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.squareFacebook),
                    onPressed: () => launchURL('https://facebook.com/${settings.socialLinks.facebook}'),
                    iconSize: 100,
                  ),
                ),
              ),
              ResponsiveWidget.isSmallScreen(context) ? Container() : LineWidget(color: Colors.transparent)
            ],
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TextButton(
                onPressed: widget.viewModel.openAbout,
                child: Text(
                  "Saiba mais sobre esse aplicativo",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
