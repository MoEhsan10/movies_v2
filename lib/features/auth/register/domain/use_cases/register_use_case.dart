import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/auth/register/domain/repositories/register_repository.dart';
import 'package:movies_v2/shared/entities/user_entity.dart';
import 'package:movies_v2/shared/error/failure.dart';

@singleton
class RegisterUseCase {
  final RegisterRepository _registerRepository;

  RegisterUseCase(this._registerRepository);

  Future<Either<Failure, UserEntity>> call(
          {
          required String userName,
          required String email,
          required String phone,
          required String password,
          required String rePassword}) =>
      _registerRepository.register(

          userName: userName,
          email: email,
          phone: phone,
          password: password,
          rePassword: rePassword);
}
