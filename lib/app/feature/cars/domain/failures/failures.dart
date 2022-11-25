import '../../../../core/failures/failure.dart';

abstract class CarFailure extends Failure {
  CarFailure({
    String errorMessage = '',
    StackTrace? stackTrace,
    String? label,
  }) : super(
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          label: label,
        );
}

class DataSourceCarFailure extends CarFailure {
  DataSourceCarFailure({
    required String errorMessage,
    StackTrace? stackTrace,
    String? label,
  }) : super(
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          label: label,
        );
}

class NoInternetCarFailure extends CarFailure {
  NoInternetCarFailure({
    String errorMessage = 'Você esta sem internet, tente novamente.',
    StackTrace? stackTrace,
    String? label,
  }) : super(
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          label: label,
        );
}

class UnknownCarFailure extends CarFailure {
  UnknownCarFailure({
    String errorMessage = 'Ocorreu um erro inesperado, tente novamente.',
    StackTrace? stackTrace,
    String? label,
  }) : super(
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          label: label,
        );
}

class InvalidCredentialsCarFailure extends CarFailure {
  InvalidCredentialsCarFailure({
    String errorMessage = 'Credenciais invalidas, tente novamente.',
    StackTrace? stackTrace,
    String? label,
  }) : super(
          errorMessage: errorMessage,
          stackTrace: stackTrace,
          label: label,
        );
}
