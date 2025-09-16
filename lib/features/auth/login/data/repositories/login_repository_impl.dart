import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/auth/login/data/data_sources/remote/login_remote_data_source.dart';
import 'package:movies_v2/features/auth/login/domain/repositories/login_repository.dart';
import 'package:movies_v2/shared/entities/user_entity.dart';
import 'package:movies_v2/shared/error/exceptions.dart';
import 'package:movies_v2/shared/error/failure.dart';

@Singleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository{

  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepositoryImpl(this._loginRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> login({required String email, required String password}) async{
    try{
      final result =
          await _loginRemoteDataSource.login(email: email, password: password);
      return Right(result);
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }

}