import 'package:dartz/dartz.dart';
import 'package:movies_v2/shared/entities/user_entity.dart';
import 'package:movies_v2/shared/error/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure,UserEntity>> login({
    required String email,
    required String password,
  });
}