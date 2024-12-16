import 'package:flutter/material.dart';

import '../../../../config/assets_path.dart';
import '../../components/responsive_widget.dart';
import '../../view_models/modal_viewmodel.dart';

class AboutPage extends StatefulWidget {
  final ModalViewModel modalViewModel;

  const AboutPage({required this.modalViewModel, super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(ResponsiveWidget.isSmallScreen(context) ? 20 : 70),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: widget.modalViewModel.closeModal,
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 20),
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        AssetsPath.iconIMG,
                        height: 300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
