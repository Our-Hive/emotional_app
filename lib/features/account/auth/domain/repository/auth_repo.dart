import 'package:diary_emotional_frontend/features/account/auth/domain/entities/login.dart';

abstract class AuthRepo {
  Future<void> login(LoginCredentials authCredentials);
}
