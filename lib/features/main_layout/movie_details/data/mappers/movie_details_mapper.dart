import 'package:movies_v2/features/main_layout/movie_details/data/model/movie_details_model.dart';
import 'package:movies_v2/features/main_layout/movie_details/domain/entities/movie_details_entity.dart';
// Add these extensions to your movie_details_mapper.dart file

extension MovieDetailsModelMapper on MovieDetailsModel {
  MovieDetailsEntity get toMovieDetailsEntity {
    return MovieDetailsEntity(
      id: id,
      title: title,
      posterUrl: posterUrl,
      mediumCoverImage: mediumCoverImage,
      largeCoverImage: largeCoverImage,
      backgroundImageOriginal: backgroundImageOriginal,
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
      addedToWatchlistAt: addedToWatchlistAt,
    );
  }
}

extension MovieDetailsEntityMapper on MovieDetailsEntity {
  MovieDetailsModel toMovieDetailsModel() {
    return MovieDetailsModel(
      id: id,
      title: title,
      posterUrl: posterUrl,
      mediumCoverImage: mediumCoverImage,
      largeCoverImage: largeCoverImage,
      backgroundImageOriginal: backgroundImageOriginal,
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
      addedToWatchlistAt: addedToWatchlistAt,
    );
  }
}