import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/browse/data/data_sources/remote/browse_remote_data_source.dart';
import 'package:movies_v2/features/main_layout/browse/domain/entities/browse_entity.dart';
import 'package:movies_v2/features/main_layout/browse/domain/repositories/browse_repository.dart';
import 'package:movies_v2/shared/error/exceptions.dart';
import 'package:movies_v2/shared/error/failure.dart';

@Singleton(as: BrowseRepository)
class BrowseRepositoryImpl implements BrowseRepository{


  final BrowseRemoteDataSource _remoteDataSource;

  BrowseRepositoryImpl(this._remoteDataSource);


  @override
  Future<Either<Failure, List<BrowseEntity>>> getMoviesByGenre(String genre) async{
    try{
      final response = await _remoteDataSource.getMoviesByGenre(genre);
      return Right(response);
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }
}