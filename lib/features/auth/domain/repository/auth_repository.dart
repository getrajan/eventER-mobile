import 'package:dartz/dartz.dart';
import 'package:eventer_app/core/errors/failure.dart';
import 'package:eventer_app/features/auth/domain/model/session_hive_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, Map<String, dynamic>>> login(
      {required Map<String, dynamic> data});
  Future<Either<Failure, String>> register(
      {required Map<String, dynamic> data});

  Future<Either<Failure, String>> saveHiveSession(
      {required SessionHive session});
  Future<Either<Failure, SessionHive>> getHiveSession();
}
