import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/home/domain/entites/movie_entity.dart';
import 'package:movies_v2/features/main_layout/home/domain/repositories/home_repository.dart';
import 'package:movies_v2/shared/error/failure.dart';

@singleton
class GetMoviesByCategoryUseCase {

  final HomeRepository _homeRepository;

  GetMoviesByCategoryUseCase(this._homeRepository);

  Future<Either<Failure, List<MovieEntity>>> call(String genre) => _homeRepository.getMoviesByGenre(genre);
}