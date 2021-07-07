import 'package:eventer_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:eventer_app/core/usecase/usecase.dart';
import 'package:eventer_app/features/explore/data/entity/event_entity.dart';
import 'package:eventer_app/features/explore/domain/respository/explore_repository.dart';

class GetUpcommingEventsUseCase
    extends CommonUseCase<List<EventEntity>, NoParams> {
  final ExploreRepository exploreRepository;

  GetUpcommingEventsUseCase({required this.exploreRepository});
  @override
  Future<Either<Failure, List<EventEntity>>> call(NoParams params) {
    return exploreRepository.getUpcommingEvents();
  }
}
