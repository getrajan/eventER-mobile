import 'package:eventer_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:eventer_app/core/usecase/usecase.dart';
import 'package:eventer_app/features/create/domain/repository/event_create_repostitory.dart';
import 'package:eventer_app/features/explore/data/entity/event_entity.dart';

class CreateEventUseCase
    extends CommonUseCase<EventEntity, Map<String, dynamic>> {
  final EventCreateRepository eventCreateRepository;

  CreateEventUseCase(this.eventCreateRepository);
  @override
  Future<Either<Failure, EventEntity>> call(Map<String, dynamic> params) {
    return eventCreateRepository.createEvent(
        data: params['data'], token: params['token']);
  }
}
