class CustomError {
  CustomError(this.message);
  final String message;

  @override
  String toString() => message;
}

class ServerError extends CustomError {
  ServerError(super.message);
}

class NetworkError extends CustomError {
  NetworkError(super.message);
}

class CacheError extends CustomError {
  CacheError(super.message);
}

class AuthError extends CustomError {
  AuthError(super.message);
}
