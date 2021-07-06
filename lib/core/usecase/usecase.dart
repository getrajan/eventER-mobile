import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer_app/core/errors/failure.dart';

abstract class CommonUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
