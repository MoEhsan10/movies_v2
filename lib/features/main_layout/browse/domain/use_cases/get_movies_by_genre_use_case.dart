import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/browse/domain/entities/browse_entity.dart';
import 'package:movies_v2/features/main_layout/browse/domain/repositories/browse_repository.dart';
import 'package:movies_v2/shared/error/failure.dart';

@singleton
class GetMoviesByGenreUseCase {
  final BrowseRepository _browseRepository;

  GetMoviesByGenreUseCase(this._browseRepository);

  Future<Either<Failure,List<BrowseEntity>>> call(String genre) => _browseRepository.getMoviesByGenre(genre);
}