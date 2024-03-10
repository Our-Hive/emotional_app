import 'package:hive_flutter/hive_flutter.dart';
import 'package:emotional_app/features/account/auth/infra/model/auth_hive_model.dart';

class HiveSetUp {
  static String authBox = 'auth_box';

  static Future<void> init() async {
    await Hive.initFlutter();
    registerHiveAdapters();
    await openBoxes();
  }

  static void registerHiveAdapters() async {
    Hive.registerAdapter(AuthHiveModelAdapter());
  }

  static Future<void> openBoxes() async {
    await Hive.openBox<AuthHiveModel>(authBox);
  }

  static Future<void> close() async {
    await Hive.close();
  }
}
