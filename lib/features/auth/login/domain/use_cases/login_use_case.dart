import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/auth/login/domain/repositories/login_repository.dart';
import 'package:movies_v2/shared/entities/user_entity.dart';
import 'package:movies_v2/shared/error/failure.dart';

@singleton
class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<Either<Failure,UserEntity>> call({
    required String email,
    required String password,
  }) => _loginRepository.login(email: email, password: password);
}