import 'package:flutter/material.dart';

import '../../../../config/providers.dart';
import '../../../projects/projects_page.dart';

class Container4ViewModel {
  void pushProjects(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectsPage(
          projectsViewModel: getIt(),
        ),
      ),
    );
  }
}
