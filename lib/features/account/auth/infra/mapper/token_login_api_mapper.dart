import 'package:diary_emotional_frontend/features/account/auth/domain/entities/token.dart';
import 'package:diary_emotional_frontend/features/account/auth/infra/model/login_api_response.dart';

class TokenLoginApiMapper {
  static Token fromApi(LoginApiResponse data) {
    return Token(
      accessToken: data.token,
    );
  }
}
