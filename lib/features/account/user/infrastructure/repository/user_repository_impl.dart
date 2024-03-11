import 'package:emotional_app/features/account/auth/domain/entities/token.dart';
import 'package:emotional_app/features/account/user/domain/data_source/user_data_source.dart';
import 'package:emotional_app/features/account/user/domain/entities/user.dart';
import 'package:emotional_app/features/account/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;
  UserRepositoryImpl(this._userDataSource);

  @override
  Future<User> deleteUser(String password) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<User> getUser(Token token) {
    return _userDataSource.getUser(token);
  }

  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
