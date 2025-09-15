import 'package:movies_v2/features/main_layout/search/domain/entities/search_entity.dart';
import 'package:movies_v2/shared/models/Data.dart';
import 'package:movies_v2/shared/models/Movies.dart';
import 'package:movies_v2/shared/models/MoviesListModel.dart';

extension SearchMapper on Movies {
  SearchEntity get toEntity =>
      SearchEntity(
        id: id,
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
  List<SearchEntity> get toEntityList => map((movie) => movie.toEntity).toList();
}


extension DataMapper on Data {
  List<SearchEntity> get toSearchEntityList => movies.toEntityList;
}


extension MoviesListModelMapper on MoviesListModel {
  List<SearchEntity> get toSearchEntityList => data.toSearchEntityList;
}
