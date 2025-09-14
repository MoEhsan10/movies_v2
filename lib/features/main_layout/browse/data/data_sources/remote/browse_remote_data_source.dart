import 'package:movies_v2/features/main_layout/browse/domain/entities/browse_entity.dart';


abstract class BrowseRemoteDataSource {
  Future<List<BrowseEntity>> getMoviesByGenre(String genre);
}