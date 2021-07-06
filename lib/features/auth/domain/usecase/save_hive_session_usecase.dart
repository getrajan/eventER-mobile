import 'package:eventer_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:eventer_app/core/usecase/usecase.dart';
import 'package:eventer_app/features/auth/domain/model/session_hive_model.dart';
import 'package:eventer_app/features/auth/domain/repository/auth_repository.dart';

class SaveSessionHiveUsecase extends CommonUseCase<String, SessionHive> {
  final AuthRepository authRepository;

  SaveSessionHiveUsecase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(SessionHive params) {
    return authRepository.saveHiveSession(session: params);
  }
}
