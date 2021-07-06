import 'package:eventer_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:eventer_app/core/usecase/usecase.dart';
import 'package:eventer_app/features/auth/domain/model/session_hive_model.dart';
import 'package:eventer_app/features/auth/domain/repository/auth_repository.dart';

class GetSessionUsecase extends CommonUseCase<SessionHive, NoParams> {
  final AuthRepository authRepository;

  GetSessionUsecase({required this.authRepository});
  @override
  Future<Either<Failure, SessionHive>> call(NoParams params) {
    return authRepository.getHiveSession();
  }
}
