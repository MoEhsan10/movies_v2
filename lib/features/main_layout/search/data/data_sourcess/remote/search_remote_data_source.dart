import 'package:movies_v2/features/main_layout/search/domain/entities/search_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchEntity>> getMoviesBySearch(String query);
}