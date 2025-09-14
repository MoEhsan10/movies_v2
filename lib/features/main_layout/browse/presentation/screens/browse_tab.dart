import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/browse/presentation/cubit/browse_cubit.dart';
import 'package:movies_v2/features/main_layout/browse/presentation/cubit/browse_state.dart';
import 'package:movies_v2/features/main_layout/browse/presentation/widgets/tab_item.dart';
import 'package:movies_v2/shared/di/service_locator.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/widgets/error_indicator.dart';
import 'package:movies_v2/shared/widgets/loading_indicator.dart';
import 'package:movies_v2/shared/widgets/movies_list.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  int selectedTabIndex = 0;
  late BrowseCubit browseCubit;
  List<String> availableGenres = [];
  Map<String, List<dynamic>> genreMoviesMap = {};

  @override
  void initState() {
    super.initState();
    browseCubit = serviceLocator.get<BrowseCubit>();
    _loadMoviesAndExtractGenres();
  }

  void _loadMoviesAndExtractGenres() async {
    browseCubit.getMoviesByGenre("");
  }

  void _extractGenresFromMovies(List<dynamic> movies) {
    final Set<String> genresSet = {};
    genreMoviesMap.clear();

    // Extract all unique genres from movies
    for (var movie in movies) {
      if (movie.genres != null && movie.genres is List) {
        for (var genre in movie.genres) {
          String genreName = genre.toString();
          genresSet.add(genreName);

          // Group movies by genre
          if (!genreMoviesMap.containsKey(genreName)) {
            genreMoviesMap[genreName] = [];
          }
          genreMoviesMap[genreName]!.add(movie);
        }
      }
    }

    // Convert to list and sort
    availableGenres = genresSet.toList()..sort();

    // Limit to first 10 genres for better UX
    if (availableGenres.length > 16) {
      availableGenres = availableGenres.take(16).toList();
    }

    // print('Available genres: $availableGenres');
    // print('Genre movie counts: ${genreMoviesMap.map((k, v) => MapEntry(k, v.length))}');
  }

  void _onTabSelected(int index) {
    if (index < availableGenres.length) {
      setState(() {
        selectedTabIndex = index;
      });
    }
  }

  List<dynamic> _getMoviesForSelectedGenre() {
    if (availableGenres.isEmpty || selectedTabIndex >= availableGenres.length) {
      return [];
    }

    final selectedGenre = availableGenres[selectedTabIndex];
    return genreMoviesMap[selectedGenre] ?? [];
  }

  @override
  void dispose() {
    browseCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          if (availableGenres.isNotEmpty)
            Container(
              padding: REdgeInsets.all(16),
              height: 80.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: availableGenres.length,
                separatorBuilder: (context, index) => SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _onTabSelected(index),
                    child: TabItem(
                      categoryName: availableGenres[index],
                      isSelected: selectedTabIndex == index,
                    ),
                  );
                },
              ),
            ),

          // Movies grid
          Expanded(
            child: BlocProvider.value(
              value: browseCubit,
              child: BlocBuilder<BrowseCubit, BrowseState>(
                builder: (context, state) {
                  if (state is GetBrowseLoading) {
                    return const Center(child: LoadingIndicator());
                  } else if (state is GetBrowseError) {
                    return Center(
                      child: ErrorIndicator(message: state.message),
                    );
                  } else if (state is GetBrowseSuccess) {
                    // Extract genres on first load
                    if (availableGenres.isEmpty) {
                      _extractGenresFromMovies(state.movies);

                      // Trigger rebuild to show tabs
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted) setState(() {});
                      });
                      return const Center(child: LoadingIndicator());
                    }

                    final selectedMovies = _getMoviesForSelectedGenre();

                    if (selectedMovies.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                            ImageAssets.empty,
                              width: 124.w,
                              height: 124.h,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              availableGenres.isNotEmpty
                                  ? 'No movies found for ${availableGenres[selectedTabIndex]}'
                                  : 'Loading genres...',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return Expanded(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 16.h,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: selectedMovies.length,
                        itemBuilder: (context, index) {
                          final movie = selectedMovies[index];
                          return SizedBox(
                            width: 189.w,
                            height: 279.h,
                            child: MoviesList(
                              browse: movie,
                              imageUrl: movie.largeCoverImage,
                              rating: movie.rating.toString(),
                            ),
                          );
                        },
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}