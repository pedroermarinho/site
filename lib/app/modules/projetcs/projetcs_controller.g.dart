// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projetcs_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjetcsController on _ProjetcsControllerBase, Store {
  final _$valueAtom = Atom(name: '_ProjetcsControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_ProjetcsControllerBaseActionController =
      ActionController(name: '_ProjetcsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ProjetcsControllerBaseActionController.startAction(
        name: '_ProjetcsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ProjetcsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
