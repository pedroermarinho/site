// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container4_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Container4Controller on _Container4ControllerBase, Store {
  final _$valueAtom = Atom(name: '_Container4ControllerBase.value');

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

  final _$_Container4ControllerBaseActionController =
      ActionController(name: '_Container4ControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_Container4ControllerBaseActionController
        .startAction(name: '_Container4ControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_Container4ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}