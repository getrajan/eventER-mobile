import 'package:dartz/dartz.dart';
import 'package:eventer_app/core/errors/failure.dart';
import 'package:eventer_app/features/explore/data/entity/event_entity.dart';
import 'package:eventer_app/features/explore/domain/model/event.dart';
import 'package:eventer_app/features/profile/data/datasource/local_source.dart';
import 'package:eventer_app/features/profile/domain/repository/profile_repository.dart';

class IProfileRepository extends ProfileRepository {
  final LocalProfileDataSource localProfileDataSource;

  IProfileRepository(this.localProfileDataSource);
  @override
  Future<Either<Failure, List<EventEntity>>> getInterestedEvents() async {
    final interestedEvents = await localProfileDataSource.getInterestedEvents();
    if (interestedEvents.isNotEmpty) {
      return Right(interestedEvents);
    } else {
      return Left(CacheFailure("No data"));
    }
  }
}
