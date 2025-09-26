import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_v2/features/main_layout/movie_details/domain/repository/movie_details_repository.dart';
import 'package:movies_v2/shared/error/failure.dart';

@singleton
class AddMovieToWatchlistUseCase {
  final MovieDetailsRepository _movieDetailsRepository;

  AddMovieToWatchlistUseCase(this._movieDetailsRepository);

  Future<Either<Failure, void>> call(MovieDetailsEntity movie, String userId) =>
      _movieDetailsRepository.addMovieToWatchList(movie, userId);
}
