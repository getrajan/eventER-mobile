import 'package:eventer_app/core/constant/text_constant.dart';
import 'package:eventer_app/features/auth/domain/model/user_hive_model.dart';
import 'package:hive/hive.dart';

abstract class AuthLocalDataSource {
  Future<void> persistUserData(UserHive user);
  Future<void> getUserData();
}

class IAuthLocalDataSource implements AuthLocalDataSource {
  @override
  Future<UserHive> getUserData() async {
    var box = await Hive.openBox<UserHive>(HIVE_USER);
    return box.values.first;
  }

  @override
  Future<void> persistUserData(UserHive user) async {
    var box = await Hive.openBox<UserHive>(HIVE_USER);
    box.add(user);
  }
}
