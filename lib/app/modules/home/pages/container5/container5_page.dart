import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/presenter/components/responsive_widget.dart';
import '../../../../core/presenter/utils/constants.dart';
import '../../components/line/line_widget.dart';
import 'container5_controller.dart';

class Container5Page extends StatefulWidget {
  @override
  _Container5PageState createState() => _Container5PageState();
}

class _Container5PageState
    extends ModularState<Container5Page, Container5Controller> {
  //use 'controller' variable to access controller

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(6),
        child: Container(
          decoration: ResponsiveWidget.isPequenoScreen(context)
              ? null
              : BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6.0,
                    ),
                  ],
                ),
          child: Padding(
            padding: ResponsiveWidget.isPequenoScreen(context)
                ? EdgeInsets.all(10)
                : EdgeInsets.all(30),
            child: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.githubSquare),
                  onPressed: () => _launchURL(Constants.profileGithub),
                  iconSize: 100,
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.medium),
                  onPressed: () => _launchURL(Constants.profileMedium),
                  iconSize: 100,
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.instagramSquare),
                  onPressed: () => _launchURL(Constants.profileInstagram),
                  iconSize: 100,
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.linkedin),
                  onPressed: () => _launchURL(Constants.profileLinkedin),
                  iconSize: 100,
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.youtubeSquare),
                  onPressed: () => _launchURL(Constants.profileYoutube),
                  iconSize: 100,
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.twitterSquare),
                  onPressed: () => _launchURL(Constants.profileTwitter),
                  iconSize: 100,
                ),
                ResponsiveWidget.isPequenoScreen(context)
                    ? Container()
                    : LineWidget(color: Colors.transparent)
              ],
            ),
          ),
        ),
      );
}
