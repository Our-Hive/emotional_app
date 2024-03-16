import 'package:emotional_app/features/account/auth/domain/entities/token.dart';
import 'package:emotional_app/features/account/user/domain/entities/user.dart';

abstract class UserDataSource {
  Future<User> getUser(Token token);
  Future<User> updateUser(User user);
  Future<User> deleteUser(String password);
}
