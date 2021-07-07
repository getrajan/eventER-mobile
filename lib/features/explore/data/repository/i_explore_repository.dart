import 'package:dartz/dartz.dart';
import 'package:eventer_app/core/constant/text_constant.dart';
import 'package:eventer_app/core/errors/exception.dart';
import 'package:eventer_app/core/errors/failure.dart';
import 'package:eventer_app/core/network/network_info.dart';
import 'package:eventer_app/features/explore/data/entity/event_entity.dart';
import 'package:eventer_app/features/explore/data/source/explore_remote_source.dart';
import 'package:eventer_app/features/explore/domain/respository/explore_repository.dart';

class IExploreRepository extends ExploreRepository {
  final ExploreRemoteSource exploreRemoteSource;
  final NetworkInfo networkInfo;

  IExploreRepository(
      {required this.exploreRemoteSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<EventEntity>>> getUpcommingEvents() async {
    if (await networkInfo.isConncected) {
      final events = await exploreRemoteSource.getInterestedEvents();
      return Right(events);
    } else {
      return Left(NoInternetFailure());
    }
  }
}
