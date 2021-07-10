import 'package:dartz/dartz.dart';
import 'package:eventer_app/core/errors/exception.dart';
import 'package:eventer_app/core/errors/failure.dart';
import 'package:eventer_app/core/network/network_info.dart';
import 'package:eventer_app/features/create/data/source/remote_sourece.dart';
import 'package:eventer_app/features/create/domain/repository/event_create_repostitory.dart';
import 'package:eventer_app/features/explore/domain/model/event.dart';

class IEventCreateRepository extends EventCreateRepository {
  final NetworkInfo networkInfo;
  final EventCreateRemoteSource eventCreateRemoteSource;

  IEventCreateRepository(this.networkInfo, this.eventCreateRemoteSource);
  @override
  Future<Either<Failure, Event>> createEvent(
      {Map<String, dynamic>? data, String? token}) async {
    if (await networkInfo.isConncected) {
      try {
        final response =
            await eventCreateRemoteSource.createEvent(data: data, token: token);
        return Right(response);
      } on FailException catch (error) {
        return Left(ApiFailure(error.message));
      } on ServerException catch (error) {
        return Left(ServerFailure(error.message));
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
