import 'package:movies_v2/features/main_layout/home/domain/entites/movie_entity.dart';

abstract class HomeRemoteDataSource {

  Future<List<MovieEntity>> getMoviesByCategory(String genre);

}