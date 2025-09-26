import 'package:movies_v2/features/main_layout/home/domain/entites/movie_entity.dart';
import 'package:movies_v2/features/main_layout/browse/domain/entities/browse_entity.dart';
import 'package:movies_v2/features/main_layout/search/domain/entities/search_entity.dart';
import 'package:movies_v2/features/main_layout/movie_details/domain/entities/movie_details_entity.dart';

class EntityConverter {
  static MovieDetailsEntity toMovieDetailsEntity(dynamic entity) {
    return MovieDetailsEntity(
      language: '',
      posterUrl: '',
      id: getId(entity),
      title: getTitle(entity),
      year: getYear(entity),
      rating: getRating(entity),
      runtime: getRuntime(entity),
      genres: getGenres(entity),
      summary: getSummary(entity),
      largeCoverImage: getLargeCover(entity),
      mediumCoverImage: getMediumCover(entity),
    );
  }

  static String getTitle(dynamic entity) {
    if (entity is MovieEntity) return entity.title;
    if (entity is BrowseEntity) return entity.title;
    if (entity is SearchEntity) return entity.title;
    return 'Unknown Title';
  }

  static int getId(dynamic entity) {
    if (entity is MovieEntity) return entity.id;
    if (entity is BrowseEntity) return entity.id;
    if (entity is SearchEntity) return entity.id;
    return 0;
  }

  static int getYear(dynamic entity) {
    if (entity is MovieEntity) return entity.year;
    if (entity is BrowseEntity) return entity.year;
    if (entity is SearchEntity) return entity.year;
    return 0;
  }

  static double getRating(dynamic entity) {
    if (entity is MovieEntity) return entity.rating;
    if (entity is BrowseEntity) return entity.rating;
    if (entity is SearchEntity) return entity.rating;
    return 0.0;
  }

  static int getRuntime(dynamic entity) {
    if (entity is MovieEntity) return entity.runtime;
    if (entity is BrowseEntity) return entity.runtime;
    if (entity is SearchEntity) return entity.runtime;
    return 0;
  }

  static String? getLargeCover(dynamic entity) {
    if (entity is MovieEntity) return entity.largeCoverImage;
    if (entity is BrowseEntity) return entity.largeCoverImage;
    if (entity is SearchEntity) return entity.largeCoverImage;
    return null;
  }

  static String? getMediumCover(dynamic entity) {
    if (entity is MovieEntity) return entity.mediumCoverImage;
    if (entity is BrowseEntity) return entity.mediumCoverImage;
    if (entity is SearchEntity) return entity.mediumCoverImage;
    return null;
  }

  static String getSummary(dynamic entity) {
    if (entity is MovieEntity) return entity.summary ?? '';
    if (entity is BrowseEntity) return entity.summary ?? '';
    if (entity is SearchEntity) return entity.summary ?? '';
    return 'No summary available.';
  }

  static List<String> getGenres(dynamic entity) {
    if (entity is MovieEntity) return entity.genres;
    if (entity is BrowseEntity) return entity.genres;
    if (entity is SearchEntity) return entity.genres;
    return [];
  }
}