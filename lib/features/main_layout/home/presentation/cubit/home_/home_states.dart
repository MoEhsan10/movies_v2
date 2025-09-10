import 'package:movies_v2/features/main_layout/home/domain/entites/movie_entity.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class GetMoviesByGenreLoading extends HomeStates {}

class GetMoviesByGenreSuccess extends HomeStates {
  List<MovieEntity> movies;

  GetMoviesByGenreSuccess(this.movies);
}

class GetMoviesByGenreError extends HomeStates {
  String message;

  GetMoviesByGenreError(this.message);
}
