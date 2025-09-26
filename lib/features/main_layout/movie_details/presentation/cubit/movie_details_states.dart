abstract class MovieDetailsStates {}

class MovieToWatchlistInitial extends MovieDetailsStates {}

class MovieToWatchlistLoading extends MovieDetailsStates {}

class MovieToWatchlistError extends MovieDetailsStates {
  final String message;

  MovieToWatchlistError(this.message);
}

class MovieToWatchlistSuccess extends MovieDetailsStates {}
