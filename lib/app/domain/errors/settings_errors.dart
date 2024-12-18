import 'generic_errors.dart';

class ErrorGetSettings extends GenericFailure {
  final String message;

  ErrorGetSettings({required this.message});
}
