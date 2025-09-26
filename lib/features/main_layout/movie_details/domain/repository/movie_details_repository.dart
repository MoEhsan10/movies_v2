import 'package:dartz/dartz.dart';
import 'package:movies_v2/features/main_layout/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_v2/shared/error/failure.dart';

abstract class MovieDetailsRepository {

  Future<Either<Failure,void>> addMovieToWatchList(MovieDetailsEntity movie, String userId);



}