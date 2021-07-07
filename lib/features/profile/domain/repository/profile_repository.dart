import 'package:dartz/dartz.dart';
import 'package:eventer_app/core/errors/failure.dart';
import 'package:eventer_app/features/explore/data/entity/event_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, List<EventEntity>>> getInterestedEvents();
}
