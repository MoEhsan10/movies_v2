import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/search/data/data_sourcess/remote/search_remote_data_source.dart';
import 'package:movies_v2/features/main_layout/search/domain/entities/search_entity.dart';
import 'package:movies_v2/features/main_layout/search/domain/repositories/search_repository.dart';
import 'package:movies_v2/shared/error/exceptions.dart';
import 'package:movies_v2/shared/error/failure.dart';

@Singleton(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository{

  final SearchRemoteDataSource _searchRemoteDataSource;

  SearchRepositoryImpl(this._searchRemoteDataSource);

  @override
  Future<Either<Failure, List<SearchEntity>>> getMoviesBySearch(String query) async {
   try {
      final response = await _searchRemoteDataSource.getMoviesBySearch(query);
      return Right(response);
    }on RemoteException catch(exception){
     return Left(Failure(message: exception.message));
   }
  }
}