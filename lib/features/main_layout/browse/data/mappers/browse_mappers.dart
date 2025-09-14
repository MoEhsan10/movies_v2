import 'package:movies_v2/features/main_layout/browse/domain/entities/browse_entity.dart';
import 'package:movies_v2/shared/models/Data.dart';
import 'package:movies_v2/shared/models/Movies.dart';
import 'package:movies_v2/shared/models/MoviesListModel.dart';

extension MoviesMapper on Movies {
  BrowseEntity get toEntity =>
      BrowseEntity(id: id,
          title: title,
          mediumCoverImage: mediumCoverImage,
          largeCoverImage: largeCoverImage,
          rating: rating,
          year: year,
          descriptionFull: descriptionFull,
          runtime: runtime,
          genres: genres,
          summary: summary,
          synopsis: synopsis,
          language: language,
          ytTrailerCode: ytTrailerCode,
          backgroundImage: backgroundImage,
      );
}


extension MoviesListMapper on List<Movies> {
  List<BrowseEntity> get toEntityList => map((movie) => movie.toEntity).toList();
}


extension DataMapper on Data {
  List<BrowseEntity> get toBrowseEntityList => movies.toEntityList;
}


extension MoviesListModelMapper on MoviesListModel {
  List<BrowseEntity> get toBrowseEntityList => data.toBrowseEntityList;
}
