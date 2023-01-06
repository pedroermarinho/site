// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectsController on _ProjectsControllerBase, Store {
  late final _$listProjectsAtom =
      Atom(name: '_ProjectsControllerBase.listProjects', context: context);

  @override
  ObservableList<Repo> get listProjects {
    _$listProjectsAtom.reportRead();
    return super.listProjects;
  }

  @override
  set listProjects(ObservableList<Repo> value) {
    _$listProjectsAtom.reportWrite(value, super.listProjects, () {
      super.listProjects = value;
    });
  }

  late final _$getGithubReposAsyncAction =
      AsyncAction('_ProjectsControllerBase.getGithubRepos', context: context);

  @override
  Future<void> getGithubRepos() {
    return _$getGithubReposAsyncAction.run(() => super.getGithubRepos());
  }

  late final _$_ProjectsControllerBaseActionController =
      ActionController(name: '_ProjectsControllerBase', context: context);

  @override
  void closeProjectsHome() {
    final _$actionInfo = _$_ProjectsControllerBaseActionController.startAction(
        name: '_ProjectsControllerBase.closeProjectsHome');
    try {
      return super.closeProjectsHome();
    } finally {
      _$_ProjectsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void closeProjects() {
    final _$actionInfo = _$_ProjectsControllerBaseActionController.startAction(
        name: '_ProjectsControllerBase.closeProjects');
    try {
      return super.closeProjects();
    } finally {
      _$_ProjectsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListProjects(List<Repo> list) {
    final _$actionInfo = _$_ProjectsControllerBaseActionController.startAction(
        name: '_ProjectsControllerBase.setListProjects');
    try {
      return super.setListProjects(list);
    } finally {
      _$_ProjectsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listProjects: ${listProjects}
    ''';
  }
}
