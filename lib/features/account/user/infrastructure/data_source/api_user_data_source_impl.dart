import 'package:dio/dio.dart';
import 'package:emotional_app/config/app_environment.dart';
import 'package:emotional_app/features/account/auth/domain/entities/token.dart';
import 'package:emotional_app/features/account/user/domain/data_source/user_data_source.dart';
import 'package:emotional_app/features/account/user/domain/entities/user.dart';
import 'package:emotional_app/features/account/user/infrastructure/mapper/api_user_mapper.dart';
import 'package:emotional_app/features/account/user/infrastructure/models/api_user.dart';

class ApiUserDataSourceImpl implements UserDataSource {
  final mapper = ApiUserMapper();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppEnvironment.apiUrl,
    ),
  );

  @override
  Future<User> getUser(Token token) async {
    final response = await _dio.get(
      '/users',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${token.accessToken}',
        },
      ),
    );
    final apiUser = ApiUser.fromJson(response.data);
    return mapper.fromApi(apiUser);
  }

  @override
  Future<User> deleteUser(String password) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
