import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenController {
  void pushHome() {
    Modular.to.pushReplacementNamed('/home');
  }
}
