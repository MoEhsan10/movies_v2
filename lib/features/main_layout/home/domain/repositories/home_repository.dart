import 'package:dartz/dartz.dart';
import 'package:movies_v2/features/main_layout/home/domain/entites/movie_entity.dart';
import 'package:movies_v2/shared/error/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<MovieEntity>>> getMoviesByGenre(String genre);
}