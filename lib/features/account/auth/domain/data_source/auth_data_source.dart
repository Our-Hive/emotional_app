import 'package:diary_emotional_frontend/features/account/auth/domain/entities/login.dart';
import 'package:diary_emotional_frontend/features/account/auth/domain/entities/token.dart';

abstract class AuthDataSource {
  Future<Token> login(LoginCredentials authCredentials);
}
