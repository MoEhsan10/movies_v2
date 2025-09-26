import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_v2/features/main_layout/movie_details/domain/use_case/add_movie_to_watchlist_use_case.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/cubit/movie_details_states.dart';

@singleton
class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  final AddMovieToWatchlistUseCase _addMovieToWatchlistUseCase;

  MovieDetailsCubit(this._addMovieToWatchlistUseCase) : super(MovieToWatchlistInitial());

  Future<void> addMovieToWatchList(MovieDetailsEntity movie, String userId) async {
    emit(MovieToWatchlistLoading());

    final result = await _addMovieToWatchlistUseCase.call(movie, userId);

    result.fold(
          (failure) => emit(MovieToWatchlistError(failure.message)),
          (success) => emit(MovieToWatchlistSuccess()),
    );

  }
}