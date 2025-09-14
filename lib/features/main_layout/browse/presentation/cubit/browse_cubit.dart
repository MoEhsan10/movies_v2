import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/browse/domain/repositories/browse_repository.dart';
import 'package:movies_v2/features/main_layout/browse/presentation/cubit/browse_state.dart';

@injectable
class BrowseCubit extends Cubit<BrowseState> {
  final BrowseRepository browseRepository;

  BrowseCubit(this.browseRepository) : super(BrowseInitial());

  Future<void> getMoviesByGenre(String genre) async {
    emit(GetBrowseLoading());

    final result = await browseRepository.getMoviesByGenre(genre);

    result.fold(
          (failure) => emit(GetBrowseError(failure.message)),
          (movies) => emit(GetBrowseSuccess(movies)),
    );
  }
}