import 'package:hive/hive.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: 0)
class AuthHiveModel extends HiveObject {
  @HiveField(0)
  String token;

  AuthHiveModel({required this.token});
}
