import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/home/data/data_sources/home_remote_data_source.dart';
import 'package:movies_v2/features/main_layout/home/domain/entites/movie_entity.dart';
import 'package:movies_v2/features/main_layout/home/domain/repositories/home_repository.dart';
import 'package:movies_v2/shared/error/exceptions.dart';
import 'package:movies_v2/shared/error/failure.dart';

@Singleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {

  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getMoviesByGenre(String genre) async{
    try{
      final response = await _remoteDataSource.getMoviesByCategory(genre);
      return Right(response);
    }on RemoteException catch(exception){
      return Left((Failure(message: exception.message)));
    }
  }



}