import 'package:dartz/dartz.dart';
import 'package:eventer_app/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, Map<String, dynamic>>> login(
      {required Map<String, dynamic> data});
  Future<Either<Failure, String>> register(
      {required Map<String, dynamic> data});
}
