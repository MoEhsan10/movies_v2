import 'package:movies_v2/features/main_layout/movie_details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRemoteDataSource {

  Future<void> addMovieToWatchList(MovieDetailsEntity movie, String userId);

}