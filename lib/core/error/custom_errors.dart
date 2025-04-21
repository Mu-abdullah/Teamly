enum ErrorType { network, graphql, noData, parsing, unknown }

class CustomError {
  final String message;
  final ErrorType type;
  final String? details;
  final StackTrace? stackTrace;

  CustomError(
    this.message, {
    this.type = ErrorType.unknown,
    this.details,
    this.stackTrace,
  });

  @override
  String toString() => 'CustomError: $message (Type: $type, Details: $details)';
}
