import 'package:emotional_app/config/app_environment.dart';
import 'package:emotional_app/features/account/auth/domain/data_source/auth_data_source.dart';
import 'package:emotional_app/features/account/auth/domain/entities/login_credentials.dart';
import 'package:emotional_app/features/account/auth/domain/entities/sign_up_credentials.dart';
import 'package:emotional_app/features/account/auth/domain/entities/token.dart';
import 'package:emotional_app/features/account/auth/infra/exceptions/invalid_credentials.dart';
import 'package:emotional_app/features/account/auth/infra/mapper/token_login_api_mapper.dart';
import 'package:emotional_app/features/account/auth/infra/model/auth_api_response.dart';
import 'package:emotional_app/shared/exceptions/http_exception.dart';
import 'package:dio/dio.dart';

class AuthApiDataSourceImpl implements AuthDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: '${AppEnvironment.apiUrl}/auth',
    ),
  );
  @override
  Future<Token> login(LoginCredentials authCredentials) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          'email': authCredentials.email,
          'password': authCredentials.password,
        },
      );
      return TokenApiMapper.fromApi(AuthApiResponse.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) throw InvalidCredentialsException();
      throw HttpException();
    } catch (e) {
      throw HttpException();
    }
  }

  @override
  Future<Token> signUp(SignUpCredentials signUpCredentials) async {
    try {
      final response = await _dio.post(
        '/signup',
        data: {
          'username': signUpCredentials.username,
          'email': signUpCredentials.email,
          'password': signUpCredentials.password,
          'birthDate': signUpCredentials.birthDate.toString(),
          'mobileNumber': signUpCredentials.phoneNumber,
          'firstName': signUpCredentials.firstName,
          'lastName': signUpCredentials.lastName,
        },
      );
      return TokenApiMapper.fromApi(
        AuthApiResponse.fromJson(
          response.data,
        ),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) throw InvalidCredentialsException();
      throw HttpException();
    } catch (e) {
      throw HttpException();
    }
  }
}
