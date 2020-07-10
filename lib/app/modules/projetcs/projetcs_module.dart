import 'package:flutter_modular/flutter_modular.dart';

import 'projetcs_controller.dart';
import 'projetcs_page.dart';

class ProjetcsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProjetcsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ProjetcsPage()),
      ];

  static Inject get to => Inject<ProjetcsModule>.of();
}
