import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/home/domain/use_cases/get_movies_by_category_use_case.dart';
import 'package:movies_v2/features/main_layout/home/presentation/cubit/home_/home_states.dart';

@singleton
class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this._getMoviesByCategoryUseCase)
      : super(HomeInitial());

  final GetMoviesByCategoryUseCase _getMoviesByCategoryUseCase;

  Future<void> getMoviesByGenre(String genreId) async {
      emit(GetMoviesByGenreLoading());
      final result = await _getMoviesByCategoryUseCase(genreId);
      result.fold(
            (failure) => emit(GetMoviesByGenreError(failure.message)),
            (movies) => emit(GetMoviesByGenreSuccess(movies)),
      );
  }

}