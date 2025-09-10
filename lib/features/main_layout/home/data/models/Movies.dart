import 'Torrents.dart';

class Movies {
  Movies({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    required this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    required this.state,
    required this.torrents,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  Movies.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        url = json['url'] as String,
        imdbCode = json['imdb_code'] as String,
        title = json['title'] as String,
        titleEnglish = json['title_english'] as String,
        titleLong = json['title_long'] as String,
        slug = json['slug'] as String,
        year = json['year'] as int,
        rating = (json['rating'] as num).toDouble(),
        runtime = json['runtime'] as int,
        genres = (json['genres'] as List<dynamic>).cast<String>(),
        summary = json['summary'] as String?,
        descriptionFull = json['description_full'] as String?,
        synopsis = json['synopsis'] as String?,
        ytTrailerCode = json['yt_trailer_code'] as String?,
        language = json['language'] as String,
        mpaRating = json['mpa_rating'] as String?,
        backgroundImage = json['background_image'] as String?,
        backgroundImageOriginal = json['background_image_original'] as String?,
        smallCoverImage = json['small_cover_image'] as String?,
        mediumCoverImage = json['medium_cover_image'] as String?,
        largeCoverImage = json['large_cover_image'] as String?,
        state = json['state'] as String,
        torrents = (json['torrents'] as List<dynamic>)
            .map((v) => Torrents.fromJson(v as Map<String, dynamic>))
            .toList(),
        dateUploaded = json['date_uploaded'] as String,
        dateUploadedUnix = json['date_uploaded_unix'] as int;

  final int id;
  final String url;
  final String imdbCode;
  final String title;
  final String titleEnglish;
  final String titleLong;
  final String slug;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  final String? summary;
  final String? descriptionFull;
  final String? synopsis;
  final String? ytTrailerCode;
  final String language;
  final String? mpaRating;
  final String? backgroundImage;
  final String? backgroundImageOriginal;
  final String? smallCoverImage;
  final String? mediumCoverImage;
  final String? largeCoverImage;
  final String state;
  final List<Torrents> torrents;
  final String dateUploaded;
  final int dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['summary'] = summary;
    map['description_full'] = descriptionFull;
    map['synopsis'] = synopsis;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['state'] = state;
    map['torrents'] = torrents.map((v) => v.toJson()).toList();
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }
}