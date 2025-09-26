class MovieDetailsModel {
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

  const MovieDetailsModel({
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
    this.addedToWatchlistAt,
  });

  // fromJson factory method
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      posterUrl: json['posterUrl'] as String,
      mediumCoverImage: json['mediumCoverImage'] as String?,
      largeCoverImage: json['largeCoverImage'] as String?,
      backgroundImageOriginal: json['backgroundImageOriginal'] as String?,
      rating: (json['rating'] as num).toDouble(),
      year: json['year'] as int,
      descriptionFull: json['descriptionFull'] as String?,
      runtime: json['runtime'] as int,
      genres: List<String>.from(json['genres'] as List),
      summary: json['summary'] as String?,
      synopsis: json['synopsis'] as String?,
      language: json['language'] as String,
      ytTrailerCode: json['ytTrailerCode'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
      addedToWatchlistAt: json['addedToWatchlistAt'] != null
          ? DateTime.parse(json['addedToWatchlistAt'] as String)
          : null,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'posterUrl': posterUrl,
      'mediumCoverImage': mediumCoverImage,
      'largeCoverImage': largeCoverImage,
      'backgroundImageOriginal': backgroundImageOriginal,
      'rating': rating,
      'year': year,
      'descriptionFull': descriptionFull,
      'runtime': runtime,
      'genres': genres,
      'summary': summary,
      'synopsis': synopsis,
      'language': language,
      'ytTrailerCode': ytTrailerCode,
      'backgroundImage': backgroundImage,
      'addedToWatchlistAt': addedToWatchlistAt?.toIso8601String(),
    };
  }

  // copyWith method for creating modified copies
  MovieDetailsModel copyWith({
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
    return MovieDetailsModel(
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