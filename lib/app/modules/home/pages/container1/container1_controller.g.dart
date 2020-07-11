// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container1_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Container1Controller on _Container1ControllerBase, Store {
  final _$valueAtom = Atom(name: '_Container1ControllerBase.value');

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

  final _$_Container1ControllerBaseActionController =
      ActionController(name: '_Container1ControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_Container1ControllerBaseActionController
        .startAction(name: '_Container1ControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_Container1ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
