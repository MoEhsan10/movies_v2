import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/home/presentation/cubit/home_/home_cubit.dart';
import 'package:movies_v2/features/main_layout/home/presentation/cubit/home_/home_states.dart';
import 'package:movies_v2/features/main_layout/home/presentation/widgets/background_image.dart';
import 'package:movies_v2/features/main_layout/home/presentation/widgets/movies_category.dart';
import 'package:movies_v2/features/main_layout/home/presentation/widgets/movies_display.dart';
import 'package:movies_v2/shared/di/service_locator.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/routes_manager/routes.dart';
import 'package:movies_v2/shared/widgets/error_indicator.dart';
import 'package:movies_v2/shared/widgets/loading_indicator.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentMovieIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 650.h,
            width: double.infinity,
            child: BlocProvider<HomeCubit>(
              create: (_) => serviceLocator.get<HomeCubit>()..getMoviesByGenre(""),
              child: BlocBuilder<HomeCubit, HomeStates>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      if (state is GetMoviesByGenreSuccess && state.movies.isNotEmpty)
                        BackgroundImage(imageUrl: state.movies[currentMovieIndex].backgroundImageOriginal ?? ImageAssets.warMovie1917)
                      else
                        const BackgroundImage(imageUrl: ImageAssets.warMovie1917),

                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: REdgeInsets.only(top: 8.h),
                          child: Image.asset(
                            ImageAssets.available,
                            width: 0.65.sw,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding:  REdgeInsets.only(bottom: 24.0),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: 0.75.sw,
                              maxHeight: 352.h,
                            ),
                            child: PageView.builder(
                              controller: PageController(viewportFraction: 1.0),
                              onPageChanged: (index) => setState(() => currentMovieIndex = index),
                              itemCount: state is GetMoviesByGenreSuccess ? state.movies.length : 6,
                              itemBuilder: (context, index) {
                                final isSuccess = state is GetMoviesByGenreSuccess;
                                final movie = isSuccess ? (state).movies[index] : null;

                                return Padding(
                                  padding: REdgeInsets.symmetric(horizontal: 12.w),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, Routes.movieDetails,
                                        arguments: movie,
                                        );
                                      },
                                      child: MoviesDisplay(
                                        movies: movie,
                                        imageUrl: movie?.largeCoverImage ?? ImageAssets.warMovie1917,
                                        rating: (movie?.rating ?? 7.7).toString(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: REdgeInsets.only(bottom: 0.h),
                          child: Image.asset(
                            ImageAssets.watchNow,
                            width: 0.85.sw,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  );

                },
              ),
            ),
          ),

          BlocProvider(
            create: (context) => serviceLocator.get<HomeCubit>()..getMoviesByGenre(""),
            child: BlocBuilder<HomeCubit, HomeStates>(
              builder: (context, state) {
                if(state is GetMoviesByGenreLoading){
                  return const LoadingIndicator();
                }else if(state is GetMoviesByGenreError){
                  return ErrorIndicator(message: state.message);
                }else if(state is GetMoviesByGenreSuccess){
                  final categories = [
                    {'name': 'Action', 'id': '28'},
                    {'name': 'Drama', 'id': '18'},
                    {'name': 'Comedy', 'id': '35'},
                    {'name': 'Horror', 'id': '27'},
                    {'name': 'Romance', 'id': '10749'},
                  ];

                  return Padding(
                    padding: REdgeInsets.all(16),
                    child: Column(
                      children: List.generate(
                        categories.length,
                            (index) {
                          final startIndex = index * 3;
                          final moviesForCategory = state.movies
                              .skip(startIndex)
                              .take(10)
                              .toList();

                          if (moviesForCategory.isEmpty) return const SizedBox();

                          return Column(
                            children: [
                              MoviesCategory(
                                movies: moviesForCategory,
                                genreName: categories[index]['name']!,
                                genreId: categories[index]['id']!,
                                onSeeMoreTap: () {
                                  //   arguments: categories[index]['id']);
                                },
                              ),
                              if (index < categories.length - 1) SizedBox(height: 16.h),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}