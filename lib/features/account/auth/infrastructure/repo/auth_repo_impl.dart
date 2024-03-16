import 'package:emotional_app/features/account/auth/domain/data_source/auth_data_source.dart';
import 'package:emotional_app/features/account/auth/domain/entities/login_credentials.dart';
import 'package:emotional_app/features/account/auth/domain/entities/sign_up_credentials.dart';
import 'package:emotional_app/features/account/auth/domain/entities/token.dart';
import 'package:emotional_app/features/account/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _authDataSource;

  AuthRepoImpl({
    required AuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;

  @override
  Future<Token> login(LoginCredentials authCredentials) async {
    return await _authDataSource.login(authCredentials);
  }

  @override
  Future<Token> signUp(SignUpCredentials signUpCredentials) async {
    return await _authDataSource.signUp(signUpCredentials);
  }
}
