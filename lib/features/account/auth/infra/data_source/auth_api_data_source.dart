import 'package:diary_emotional_frontend/config/app_environment.dart';
import 'package:diary_emotional_frontend/features/account/auth/domain/data_source/auth_data_source.dart';
import 'package:diary_emotional_frontend/features/account/auth/domain/entities/login.dart';
import 'package:diary_emotional_frontend/features/account/auth/domain/entities/token.dart';
import 'package:diary_emotional_frontend/features/account/auth/infra/exceptions/invalid_credentials.dart';
import 'package:diary_emotional_frontend/features/account/auth/infra/mapper/token_login_api_mapper.dart';
import 'package:diary_emotional_frontend/features/account/auth/infra/model/login_api_response.dart';
import 'package:diary_emotional_frontend/shared/exceptions/http_exception.dart';
import 'package:dio/dio.dart';

class AuthApiDataSourceImpl implements AuthDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppEnvironment.apiUrl,
    ),
  );
  @override
  Future<Token> login(LoginCredentials authCredentials) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'email': authCredentials.email,
          'password': authCredentials.password,
        },
      );
      return TokenLoginApiMapper.fromApi(
          LoginApiResponse.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) throw InvalidCredentialsException();
      throw HttpException();
    } catch (e) {
      throw HttpException();
    }
  }
}