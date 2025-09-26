import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/home/presentation/cubit/home_/home_cubit.dart';
import 'package:movies_v2/features/main_layout/home/presentation/cubit/home_/home_states.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/entity_converter.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/di/service_locator.dart';
import 'package:movies_v2/shared/widgets/error_indicator.dart';
import 'package:movies_v2/shared/widgets/loading_indicator.dart';
import 'package:movies_v2/shared/widgets/movies_list.dart';

class SimilarMoviesSection extends StatelessWidget {
  final dynamic entity;

  const SimilarMoviesSection({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final genres = EntityConverter.getGenres(entity);
    final genre = genres.isNotEmpty ? genres.first : "action";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Similar Movies', style: AppStyles.mainStyle),
        SizedBox(height: 18.h),
        BlocProvider(
          create: (context) => serviceLocator.get<HomeCubit>()..getMoviesByGenre(genre),
          child: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              if (state is GetMoviesByGenreLoading) {
                return const LoadingIndicator();
              } else if (state is GetMoviesByGenreError) {
                return ErrorIndicator(message: state.message);
              } else if (state is GetMoviesByGenreSuccess) {
                final movies = state.movies.take(6).toList();
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: movies.length,
                  itemBuilder: (context, index) => MoviesList(
                    movie: movies[index],
                    rating: movies[index].rating.toStringAsFixed(1),
                    imageUrl: movies[index].mediumCoverImage,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 18.h,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}