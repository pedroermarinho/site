import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';
import 'package:result_command/result_command.dart';

import '../../../domain/errors/generic_errors.dart';

class BuildCommandWidget<T extends Object> extends StatelessWidget {
  final Command<T> command;
  final Widget Function(T) success;
  final Widget? loading;
  final Widget Function(String)? failure;

  const BuildCommandWidget({required this.command, required this.success, super.key, this.loading, this.failure});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<CommandState<T>>(
        valueListenable: command,
        builder: (context, state, _) {
          if (state is RunningCommand<T>) {
            return loading ?? _buildLoading();
          } else if (state is FailureCommand<T>) {
            return _buildError(state.error);
          } else if (state is SuccessCommand<T>) {
            return success.call(state.value);
          } else {
            return _buildError();
          }
        },
      );

  Widget _buildLoading() => Center(
        child: Tooltip(
          message: "Carregando informações",
          child: CircularProgressIndicator(),
        ),
      );

  Widget _buildError([Exception? e]) {
    var message = "Erro ao carregar as informações";
    if (e is GenericFailure) {
      message += ": ${e.message}";
    }
    Logger().e(message);
    return failure?.call(message) ??
        Center(
          child: Tooltip(
            message: message,
            child: Icon(FontAwesomeIcons.triangleExclamation),
          ),
        );
  }
}
