import 'package:eventer_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:eventer_app/core/usecase/usecase.dart';
import 'package:eventer_app/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase
    extends CommonUseCase<Map<String, dynamic>, Map<String, dynamic>> {
  final AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
      Map<String, dynamic> params) {
    return authRepository.login(data: params);
  }
}
