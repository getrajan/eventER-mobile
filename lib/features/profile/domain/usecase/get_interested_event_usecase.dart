import 'package:eventer_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:eventer_app/core/usecase/usecase.dart';
import 'package:eventer_app/features/explore/data/entity/event_entity.dart';
import 'package:eventer_app/features/explore/domain/model/event.dart';
import 'package:eventer_app/features/profile/domain/repository/profile_repository.dart';

class GetInterestedEventsUseCase
    extends CommonUseCase<List<EventEntity>, NoParams> {
  final ProfileRepository profileRepository;

  GetInterestedEventsUseCase(this.profileRepository);
  @override
  Future<Either<Failure, List<EventEntity>>> call(NoParams params) {
    return profileRepository.getInterestedEvents();
  }
}
