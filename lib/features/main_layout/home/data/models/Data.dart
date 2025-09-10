
import 'package:movies_v2/features/main_layout/home/data/models/Movies.dart';

class Data {
  Data({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movies,
  });

  Data.fromJson(Map<String, dynamic> json)
      : movieCount = json['movie_count'] as int,
        limit = json['limit'] as int,
        pageNumber = json['page_number'] as int,
        movies = (json['movies'] as List<dynamic>)
            .map((v) => Movies.fromJson(v as Map<String, dynamic>))
            .toList();

  final int movieCount;
  final int limit;
  final int pageNumber;
  final List<Movies> movies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movie_count'] = movieCount;
    map['limit'] = limit;
    map['page_number'] = pageNumber;
    map['movies'] = movies.map((v) => v.toJson()).toList();
    return map;
  }
}