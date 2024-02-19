import 'package:diary_emotional_frontend/features/account/auth/domain/data_source/auth_data_source.dart';
import 'package:diary_emotional_frontend/features/account/auth/domain/entities/login.dart';
import 'package:diary_emotional_frontend/features/account/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _authDataSource;
  AuthRepoImpl(
    this._authDataSource,
  );

  @override
  Future<void> login(LoginCredentials authCredentials) async {
    await _authDataSource.login(authCredentials);
  }
}
