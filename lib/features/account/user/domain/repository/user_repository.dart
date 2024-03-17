import 'package:emotional_app/features/account/auth/domain/entities/token.dart';
import 'package:emotional_app/features/account/user/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUser(Token token);
  Future<User> updateUser(User user);
  Future<bool> disableUser(Token token, String password);
}
