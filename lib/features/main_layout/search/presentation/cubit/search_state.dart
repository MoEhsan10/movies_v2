import 'package:movies_v2/features/main_layout/search/domain/entities/search_entity.dart';

abstract class SearchState{}

class SearchInitial extends SearchState{}


class GetMoviesBySearchLoading extends SearchState{}
class GetMoviesBySearchError extends SearchState{
  final String message;

  GetMoviesBySearchError({required this.message});
}
class GetMoviesBySearchSuccess extends SearchState{
  final List<SearchEntity> movies;

  GetMoviesBySearchSuccess({required this.movies});
}
