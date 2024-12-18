import 'package:logger/logger.dart';

import '../domain/errors/generic_errors.dart';

T parseJson<T>(dynamic data, T Function(Map<String, dynamic>) fromJson) {
  try {
    if (data is Map<String, dynamic>) {
      return fromJson(data);
    } else {
      throw FormatFailure(message: "Formato de JSON inválido");
    }
  } catch (e, stackTrace) {
    Logger().e(
      "Erro ao fazer parsing do JSON: $e",
      error: e,
      stackTrace: stackTrace,
    );
    throw FormatFailure(message: "Erro ao fazer parsing do JSON");
  }
}
