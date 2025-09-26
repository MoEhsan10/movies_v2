// movie_details_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/cubit/movie_details_states.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/entity_converter.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/movie_hero_section.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/movie_content_section.dart';
import 'package:movies_v2/shared/di/service_locator.dart';
import 'package:movies_v2/shared/shared_preferences/user_preferences.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  bool isBookmarked = false;
  late final MovieDetailsCubit _movieDetailsCubit;

  @override
  void initState() {
    super.initState();
    _movieDetailsCubit = serviceLocator.get<MovieDetailsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final entity = _getEntityFromArguments();

    return BlocProvider.value(
      value: _movieDetailsCubit,
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<MovieDetailsCubit, MovieDetailsStates>(
            listener: _handleWatchlistStateChanges,
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MovieHeroSection(
                      entity: entity,
                      isBookmarked: isBookmarked,
                      onBookmarkTap: () => _handleBookmarkTap(entity),
                    ),
                    MovieContentSection(entity: entity),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleBookmarkTap(dynamic entity) async {
    setState(() => isBookmarked = !isBookmarked);

    if (isBookmarked) {
      final movieDetailsEntity = EntityConverter.toMovieDetailsEntity(entity);
      final userId = await UserPreferences.getUserId();

      if (!mounted) return;

      if (userId != null) {
        if (!_movieDetailsCubit.isClosed) {
          _movieDetailsCubit.addMovieToWatchList(movieDetailsEntity, userId);
        } else {
          if (mounted) {
            setState(() => isBookmarked = false);
          }
        }
      } else {
        _showLoginRequiredMessage();
        if (mounted) {
          setState(() => isBookmarked = false);
        }
      }
    }
  }

  void _showLoginRequiredMessage() {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please log in to add movies to watchlist'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  dynamic _getEntityFromArguments() {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments is Map<String, dynamic>) {
      return arguments['movie'] ?? arguments['browse'] ?? arguments['search'];
    }
    return arguments;
  }

  void _handleWatchlistStateChanges(BuildContext context, MovieDetailsStates state) {
    if (state is MovieToWatchlistSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Movie added to watchlist successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } else if (state is MovieToWatchlistError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${state.message}'),
          backgroundColor: Colors.red,
        ),
      );
      setState(() => isBookmarked = false);
    }
  }
}