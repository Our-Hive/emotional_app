import 'package:emotional_app/features/account/auth/domain/data_source/auth_local_data_source.dart';
import 'package:emotional_app/features/account/auth/domain/entities/token.dart';
import 'package:emotional_app/features/account/auth/domain/repository/auth_local_repo.dart';

class AuthLocalRepoImpl implements AuthLocalRepo {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepoImpl({required AuthLocalDataSource authLocalDataSource})
      : _authLocalDataSource = authLocalDataSource;

  @override
  Future<bool> saveAuthToken(Token token) {
    return _authLocalDataSource.saveAuthToken(token);
  }

  @override
  Future<Token> getAuthToken() {
    return _authLocalDataSource.getAuthToken();
  }

  @override
  Future<bool> deleteAuthToken() {
    return _authLocalDataSource.deleteAuthToken();
  }
}
