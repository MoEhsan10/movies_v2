class MovieDetailsEntity {
  final int id;
  final String title;
  final String posterUrl;
  final String? mediumCoverImage;
  final String? largeCoverImage;
  final String? backgroundImageOriginal;
  final double rating;
  final int year;
  final String? descriptionFull;
  final int runtime;
  final List<String> genres;
  final String? summary;
  final String? synopsis;
  final String language;
  final String? ytTrailerCode;
  final String? backgroundImage;
  final DateTime? addedToWatchlistAt;

  const MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.posterUrl,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.backgroundImageOriginal,
    required this.rating,
    required this.year,
    this.descriptionFull,
    required this.runtime,
    required this.genres,
    this.summary,
    this.synopsis,
    required this.language,
    this.ytTrailerCode,
    this.backgroundImage,
    this.addedToWatchlistAt,
  });

  // copyWith method
  MovieDetailsEntity copyWith({
    int? id,
    String? title,
    String? posterUrl,
    String? mediumCoverImage,
    String? largeCoverImage,
    String? backgroundImageOriginal,
    double? rating,
    int? year,
    String? descriptionFull,
    int? runtime,
    List<String>? genres,
    String? summary,
    String? synopsis,
    String? language,
    String? ytTrailerCode,
    String? backgroundImage,
    DateTime? addedToWatchlistAt,
  }) {
    return MovieDetailsEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      posterUrl: posterUrl ?? this.posterUrl,
      mediumCoverImage: mediumCoverImage ?? this.mediumCoverImage,
      largeCoverImage: largeCoverImage ?? this.largeCoverImage,
      backgroundImageOriginal: backgroundImageOriginal ?? this.backgroundImageOriginal,
      rating: rating ?? this.rating,
      year: year ?? this.year,
      descriptionFull: descriptionFull ?? this.descriptionFull,
      runtime: runtime ?? this.runtime,
      genres: genres ?? this.genres,
      summary: summary ?? this.summary,
      synopsis: synopsis ?? this.synopsis,
      language: language ?? this.language,
      ytTrailerCode: ytTrailerCode ?? this.ytTrailerCode,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      addedToWatchlistAt: addedToWatchlistAt ?? this.addedToWatchlistAt,
    );
  }
}