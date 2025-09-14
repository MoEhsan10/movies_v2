import 'package:dartz/dartz.dart';
import 'package:movies_v2/features/main_layout/browse/domain/entities/browse_entity.dart';
import 'package:movies_v2/shared/error/failure.dart';

abstract class BrowseRepository {
  Future<Either<Failure,List<BrowseEntity>>> getMoviesByGenre(String genre);
}