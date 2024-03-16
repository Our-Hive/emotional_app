import 'package:emotional_app/shared/infrastructure/hive/hive_setup.dart';
import 'package:hive/hive.dart';
import 'package:emotional_app/features/account/auth/infrastructure/model/auth_hive_model.dart';

class Boxes {
  static Box<AuthHiveModel> authBox() =>
      Hive.box<AuthHiveModel>(HiveSetUp.authBox);
}
