import 'package:movies_v2/features/main_layout/home/data/models/Movies.dart';
import 'package:movies_v2/features/main_layout/home/data/models/Data.dart';
import 'package:movies_v2/features/main_layout/home/data/models/MoviesListModel.dart';
import 'package:movies_v2/features/main_layout/home/domain/entites/movie_entity.dart';

extension MoviesMapper on Movies {
  MovieEntity get toEntity => MovieEntity(
      id: id,
      title: title,
      posterUrl: url,
      mediumCoverImage: mediumCoverImage,
      largeCoverImage: largeCoverImage,
      backgroundImageOriginal: backgroundImageOriginal,
      descriptionFull: descriptionFull,
      rating: rating,
      year: year,
      runtime: runtime,
      genres: genres,
      language: language);
}

// List<Movies> to List<MovieEntity> mapper
extension MoviesListMapper on List<Movies> {
  List<MovieEntity> get toEntityList => map((movie) => movie.toEntity).toList();
}

// Data to List<MovieEntity> mapper
extension DataMapper on Data {
  List<MovieEntity> get toMovieEntityList => movies.toEntityList;
}

// MoviesListModel to List<MovieEntity> mapper
extension MoviesListModelMapper on MoviesListModel {
  List<MovieEntity> get toMovieEntityList => data.toMovieEntityList;
}
