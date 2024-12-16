import 'package:flutter/material.dart';

import '../../../../config/providers.dart';
import '../../../home/home_page.dart';

class SplashScreenViewModel {
  void pushHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          homeViewModel: getIt(),
          modalViewModel: getIt(),
        ),
      ),
    );
  }
}
