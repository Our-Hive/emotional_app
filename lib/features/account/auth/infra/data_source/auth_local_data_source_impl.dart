import 'package:emotional_app/features/account/auth/domain/data_source/auth_local_data_source.dart';
import 'package:emotional_app/features/account/auth/domain/entities/token.dart';
import 'package:emotional_app/features/account/auth/infra/model/auth_hive_model.dart';
import 'package:emotional_app/shared/infra/hive/hive_setup.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box<AuthHiveModel> _authBox =
      Hive.box<AuthHiveModel>(HiveSetUp.authBox);

  @override
  Future<bool> saveAuthToken(Token token) async {
    try {
      if (_authBox.values.isEmpty) {
        await _authBox.add(AuthHiveModel(token: token.accessToken));
        return true;
      } else {
        await _authBox.putAt(0, AuthHiveModel(token: token.accessToken));
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Token> getAuthToken() {
    if (_authBox.values.isNotEmpty) {
      return Future.value(Token(accessToken: _authBox.getAt(0)!.token));
    }
    throw Exception('No auth token found.');
  }

  @override
  Future<bool> deleteAuthToken() async {
    if (_authBox.values.isNotEmpty) {
      await _authBox.deleteAt(0);
      return true;
    }
    return false;
  }
}
