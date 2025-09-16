import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/auth/register/data/data_sources/remote/register_remote_data_source.dart';
import 'package:movies_v2/features/auth/register/domain/repositories/register_repository.dart';
import 'package:movies_v2/shared/entities/user_entity.dart';
import 'package:movies_v2/shared/error/exceptions.dart';
import 'package:movies_v2/shared/error/failure.dart';

@Singleton(as: RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository {

  final RegisterRemoteDataSource _registerRemoteDataSource;

  RegisterRepositoryImpl(this._registerRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> register({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String rePassword}) async {

    try{
      final result = await _registerRemoteDataSource.register(
          userName: userName,
          email: email,
          password: password,
          rePassword: rePassword);
      return Right(result);
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }

  }
}
