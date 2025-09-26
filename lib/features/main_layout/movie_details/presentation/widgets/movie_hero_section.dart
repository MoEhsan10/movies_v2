import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/cubit/movie_details_states.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/entity_converter.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';

class MovieHeroSection extends StatelessWidget {
  final dynamic entity;
  final bool isBookmarked;
  final VoidCallback onBookmarkTap;

  const MovieHeroSection({
    super.key,
    required this.entity,
    required this.isBookmarked,
    required this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 645.h,
      child: Stack(
        children: [
          _buildMoviePoster(),
          _buildGradientOverlay(),
          _buildBackButton(context),
          _buildBookmarkButton(),
          _buildMovieInfo(),
        ],
      ),
    );
  }

  Widget _buildMoviePoster() {
    final largeCover = EntityConverter.getLargeCover(entity);
    final mediumCover = EntityConverter.getMediumCover(entity);

    return Positioned.fill(
      child: Image.network(
        largeCover ?? mediumCover ?? '',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey[300],
          child: const Icon(Icons.movie, size: 100, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
            stops: const [0.0, 0.3, 0.6, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 29.h,
      left: 16.w,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 24.w),
        ),
      ),
    );
  }

  Widget _buildBookmarkButton() {
    return Positioned(
      top: 29.h,
      right: 16.w,
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsStates>(
        builder: (context, state) {
          return GestureDetector(
            onTap: state is MovieToWatchlistLoading ? null : onBookmarkTap,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: state is MovieToWatchlistLoading
                  ? SizedBox(
                width: 24.w,
                height: 24.w,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
                  : Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.white,
                size: 24.w,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMovieInfo() {
    return Positioned(
      left: 20.w,
      right: 20.w,
      bottom: 20.h,
      child: Column(
        children: [
          Text(
            EntityConverter.getTitle(entity),
            style: AppStyles.mainStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            EntityConverter.getYear(entity).toString(),
            style: AppStyles.year,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
