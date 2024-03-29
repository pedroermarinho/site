// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$projectsAtom =
      Atom(name: '_HomeControllerBase.projects', context: context);

  @override
  Widget get projects {
    _$projectsAtom.reportRead();
    return super.projects;
  }

  @override
  set projects(Widget value) {
    _$projectsAtom.reportWrite(value, super.projects, () {
      super.projects = value;
    });
  }

  late final _$aboutAtom =
      Atom(name: '_HomeControllerBase.about', context: context);

  @override
  Widget get about {
    _$aboutAtom.reportRead();
    return super.about;
  }

  @override
  set about(Widget value) {
    _$aboutAtom.reportWrite(value, super.about, () {
      super.about = value;
    });
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  void openProjects() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.openProjects');
    try {
      return super.openProjects();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void closeProjects() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.closeProjects');
    try {
      return super.closeProjects();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void openAbout() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.openAbout');
    try {
      return super.openAbout();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void closeAbout() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.closeAbout');
    try {
      return super.closeAbout();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
projects: ${projects},
about: ${about}
    ''';
  }
}
