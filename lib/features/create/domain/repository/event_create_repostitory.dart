import 'package:dartz/dartz.dart';
import 'package:eventer_app/core/errors/failure.dart';
import 'package:eventer_app/features/explore/domain/model/event.dart';

abstract class EventCreateRepository {
  Future<Either<Failure, Event>> createEvent(
      {Map<String, dynamic>? data, String? token});
}
