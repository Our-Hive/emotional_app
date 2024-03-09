import 'package:emotional_app/features/account/auth/domain/entities/login_credentials.dart';
import 'package:emotional_app/features/account/auth/domain/entities/token.dart';

abstract class AuthRepo {
  Future<Token> login(LoginCredentials authCredentials);
}
