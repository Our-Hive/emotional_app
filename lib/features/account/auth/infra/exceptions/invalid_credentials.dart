class InvalidCredentialsException implements Exception {
  final String message;

  InvalidCredentialsException({this.message = 'Invalid credentials'});
}
