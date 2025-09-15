
import 'package:dartz/dartz.dart';
import 'package:movies_v2/features/main_layout/search/domain/entities/search_entity.dart';
import 'package:movies_v2/features/main_layout/search/domain/repositories/search_repository.dart';
import 'package:movies_v2/shared/error/failure.dart';

class GetMoviesBySearch {
  final SearchRepository _searchRepository;

  GetMoviesBySearch(this._searchRepository);

  Future<Either<Failure,List<SearchEntity>>> call(String query) => _searchRepository.getMoviesBySearch(query);
}