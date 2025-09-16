import 'package:dartz/dartz.dart';
import 'package:movies_v2/shared/entities/user_entity.dart';
import 'package:movies_v2/shared/error/failure.dart';

abstract class RegisterRepository {
  Future<Either<Failure,UserEntity>> register({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String rePassword,
  });
}