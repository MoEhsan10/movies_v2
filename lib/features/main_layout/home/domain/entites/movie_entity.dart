class MovieEntity {
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

  const MovieEntity({
    required this.largeCoverImage,
    required this.backgroundImageOriginal,
    required this.mediumCoverImage,
    required this.descriptionFull,
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.rating,
    required this.year,
    required this.runtime,
    required this.genres,
    this.summary,
    this.synopsis,
    required this.language,
    this.ytTrailerCode,
    this.backgroundImage,
  });
}