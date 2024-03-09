import 'package:emotional_app/features/account/auth/domain/entities/login.dart';
import 'package:emotional_app/features/account/auth/domain/entities/token.dart';

abstract class AuthDataSource {
  Future<Token> login(LoginCredentials authCredentials);
}
