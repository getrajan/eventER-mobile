import 'package:dartz/dartz.dart';
import 'package:eventer_app/core/constant/text_constant.dart';
import 'package:eventer_app/core/errors/exception.dart';
import 'package:eventer_app/core/errors/failure.dart';
import 'package:eventer_app/core/network/network_info.dart';
import 'package:eventer_app/features/auth/data/datasource/local_datasource.dart';
import 'package:eventer_app/features/auth/data/datasource/remote_datasource.dart';
import 'package:eventer_app/features/auth/domain/model/session_hive_model.dart';
import 'package:eventer_app/features/auth/domain/model/user_hive_model.dart';
import 'package:eventer_app/features/auth/domain/repository/auth_repository.dart';

class IAuthRepository extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;
  final AuthLocalDataSource authLocalDataSource;

  IAuthRepository({
    required this.authRemoteDataSource,
    required this.networkInfo,
    required this.authLocalDataSource,
  });
  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
      {required Map<String, dynamic> data}) async {
    if (await networkInfo.isConncected) {
      try {
        final responseData = await authRemoteDataSource.login(data: data);
        UserHive userHive = UserHive(
            token: responseData['token'],
            fullName: responseData['data']['user']['name'],
            email: responseData['data']['user']['email'],
            type: responseData['data']['user']['type'],
            profilePhoto: responseData['data']['user']['profilePhoto']);
        authLocalDataSource.persistUserData(userHive);

        return Right(responseData);
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      } on FailException catch (err) {
        return Left(ApiFailure(err.message));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, String>> register(
      {required Map<String, dynamic> data}) async {
    return right("r");
  }

  @override
  Future<Either<Failure, SessionHive>> getHiveSession() async {
    try {
      final SessionHive? session = await authLocalDataSource.getSession();
      if (session != null) {
        return Right(session);
      } else {
        return Left(CacheFailure(CACHE_FAILURE_MESSAGE));
      }
    } on CacheException catch (error) {
      return Left(CacheFailure(error.message));
    }
  }

  @override
  Future<Either<Failure, String>> saveHiveSession(
      {required SessionHive session}) async {
    try {
      final message = await authLocalDataSource.persistSession(session);
      if (message == CACHE_SUCCESS_MESSAGE) {
        return Right(message);
      } else {
        return Left(CacheFailure(message));
      }
    } on CacheException catch (err) {
      return Left(CacheFailure(err.message));
    }
  }
}
