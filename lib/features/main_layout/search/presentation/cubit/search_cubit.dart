import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/search/domain/repositories/search_repository.dart';
import 'package:movies_v2/features/main_layout/search/presentation/cubit/search_state.dart';

@singleton
class SearchCubit extends Cubit<SearchState> {
  final SearchRepository _searchRepository;

  SearchCubit(this._searchRepository) : super(SearchInitial());

  Future<void> getMoviesBySearch(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(GetMoviesBySearchLoading());

    final result = await _searchRepository.getMoviesBySearch(query);

    result.fold(
          (failure) => emit(GetMoviesBySearchError(message: failure.message)),
          (movies) => emit(GetMoviesBySearchSuccess(movies: movies)),
    );
  }

  void clearSearch() {
    emit(SearchInitial());
  }
}