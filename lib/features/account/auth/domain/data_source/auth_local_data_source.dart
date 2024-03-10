import 'package:emotional_app/features/account/auth/domain/entities/token.dart';

abstract class AuthLocalDataSource {
  Future<bool> saveAuthToken(Token token);
  Future<Token> getAuthToken();
  Future<bool> deleteAuthToken();
}
