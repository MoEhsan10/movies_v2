import 'package:dartz/dartz.dart';
import 'package:movies_v2/features/main_layout/search/domain/entities/search_entity.dart';
import 'package:movies_v2/shared/error/failure.dart';

abstract class SearchRepository {
  Future<Either<Failure,List<SearchEntity>>> getMoviesBySearch(String query);
}