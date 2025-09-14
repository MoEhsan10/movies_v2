class BrowseEntity {
  final int id;
  final String title;
  final String? mediumCoverImage;
  final String? largeCoverImage;
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

  BrowseEntity(
      {required this.id,
      required this.title,
      required this.mediumCoverImage,
      required this.largeCoverImage,
      required this.rating,
      required this.year,
      required this.descriptionFull,
      required this.runtime,
      required this.genres,
      required this.summary,
      required this.synopsis,
      required this.language,
      required this.ytTrailerCode,
      required this.backgroundImage});
}
