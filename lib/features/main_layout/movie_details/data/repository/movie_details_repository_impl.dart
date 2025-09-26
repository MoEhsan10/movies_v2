import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/movie_details/data/data_sources/remote/movie_details_remote_data_source.dart';
import 'package:movies_v2/features/main_layout/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_v2/features/main_layout/movie_details/domain/repository/movie_details_repository.dart';
import 'package:movies_v2/shared/error/exceptions.dart';
import 'package:movies_v2/shared/error/failure.dart';

@Singleton(as: MovieDetailsRepository)
class MovieDetailsRepositoryImpl implements MovieDetailsRepository{

  final MovieDetailsRemoteDataSource _movieDetailsRemoteDataSource;

  MovieDetailsRepositoryImpl(this._movieDetailsRemoteDataSource);

  @override
  Future<Either<Failure, void>> addMovieToWatchList(MovieDetailsEntity movie, String userId) async {
    try {
      await _movieDetailsRemoteDataSource.addMovieToWatchList(movie, userId);
      return const Right(null);
    } on RemoteException catch(exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(Failure(message: 'Unexpected error: $e'));
    }
  }}