import 'package:emotional_app/features/account/user/domain/entities/user.dart';
import 'package:emotional_app/features/account/user/infrastructure/models/api_user.dart';

class ApiUserMapper {
  User fromApi(ApiUser apiUser) {
    return User(
      firstName: apiUser.firstName,
      lastName: apiUser.lastName,
      userName: apiUser.username,
      email: apiUser.email,
      phoneNumber: apiUser.mobileNumber,
      birthDate: apiUser.birthDate,
    );
  }
}
