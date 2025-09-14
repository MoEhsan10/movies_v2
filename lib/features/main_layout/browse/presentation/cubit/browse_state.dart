import 'package:movies_v2/features/main_layout/browse/domain/entities/browse_entity.dart';

abstract class BrowseState {}

class BrowseInitial extends BrowseState{}


class GetBrowseLoading extends BrowseState{}

class GetBrowseError extends BrowseState{
 final String message;

  GetBrowseError(this.message);
}


class GetBrowseSuccess extends BrowseState{
  final List<BrowseEntity> movies;

  GetBrowseSuccess(this.movies);
}
