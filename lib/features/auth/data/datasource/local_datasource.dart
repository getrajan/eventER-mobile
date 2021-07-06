import 'package:eventer_app/core/constant/text_constant.dart';
import 'package:eventer_app/core/errors/exception.dart';
import 'package:eventer_app/features/auth/domain/model/session_hive_model.dart';
import 'package:eventer_app/features/auth/domain/model/user_hive_model.dart';
import 'package:hive/hive.dart';

abstract class AuthLocalDataSource {
  Future<void> persistUserData(UserHive user);
  Future<UserHive> getUserData();
  Future<String> persistSession(SessionHive session);
  Future<SessionHive> getSession();
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

  @override
  Future<SessionHive> getSession() async {
    var box = await Hive.openBox<SessionHive>(HIVE_SESSION);
    final SessionHive? session = box.length > 0 ? box.values.first : null;
    if (session != null) {
      return session;
    } else {
      throw CacheException(message: CACHE_FAILURE_MESSAGE);
    }
  }

  @override
  Future<String> persistSession(SessionHive session) async {
    try {
      var box = await Hive.openBox<SessionHive>(HIVE_SESSION);
      if (box.isEmpty) {
        box.add(session);
      } else {
        box.putAt(0, session);
      }
      return CACHE_SUCCESS_MESSAGE;
    } catch (err) {
      throw CacheException(message: err.toString());
    }
  }
}
