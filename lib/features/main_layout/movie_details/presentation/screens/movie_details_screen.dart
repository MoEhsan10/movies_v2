import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/home/domain/entites/movie_entity.dart';
import 'package:movies_v2/features/main_layout/browse/domain/entities/browse_entity.dart';
import 'package:movies_v2/features/main_layout/search/domain/entities/search_entity.dart';
import 'package:movies_v2/features/main_layout/home/presentation/cubit/home_/home_cubit.dart';
import 'package:movies_v2/features/main_layout/home/presentation/cubit/home_/home_states.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/cast_box.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/information_box.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/screen_shot_list.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/di/service_locator.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';
import 'package:movies_v2/shared/widgets/custom_elevated_button.dart';
import 'package:movies_v2/shared/widgets/error_indicator.dart';
import 'package:movies_v2/shared/widgets/loading_indicator.dart';
import 'package:movies_v2/shared/widgets/movies_list.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  bool isBookmarked = false;

  String getTitle(dynamic entity) {
    if (entity is MovieEntity) return entity.title;
    if (entity is BrowseEntity) return entity.title;
    if (entity is SearchEntity) return entity.title;
    return 'Unknown Title';
  }

  int getYear(dynamic entity) {
    if (entity is MovieEntity) return entity.year;
    if (entity is BrowseEntity) return entity.year;
    if (entity is SearchEntity) return entity.year ;
    return 0;
  }

  double getRating(dynamic entity) {
    if (entity is MovieEntity) return entity.rating;
    if (entity is BrowseEntity) return entity.rating;
    if (entity is SearchEntity) return entity.rating;
    return 0.0;
  }

  int getRuntime(dynamic entity) {
    if (entity is MovieEntity) return entity.runtime;
    if (entity is BrowseEntity) return entity.runtime;
    if (entity is SearchEntity) return entity.runtime;
    return 0;
  }

  String? getLargeCover(dynamic entity) {
    if (entity is MovieEntity) return entity.largeCoverImage;
    if (entity is BrowseEntity) return entity.largeCoverImage;
    if (entity is SearchEntity) return entity.largeCoverImage;
    return null;
  }

  String? getMediumCover(dynamic entity) {
    if (entity is MovieEntity) return entity.mediumCoverImage;
    if (entity is BrowseEntity) return entity.mediumCoverImage;
    if (entity is SearchEntity) return entity.mediumCoverImage;
    return null;
  }

  String getSummary(dynamic entity) {
    if (entity is MovieEntity) return entity.summary ?? '';
    if (entity is BrowseEntity) return entity.summary ?? '';
    if (entity is SearchEntity) return entity.summary ?? '';
    return 'No summary available.';
  }

  List<String> getGenres(dynamic entity) {
    if (entity is MovieEntity) return entity.genres;
    if (entity is BrowseEntity) return entity.genres;
    if (entity is SearchEntity) return entity.genres;
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;


    dynamic entity;
    if (arguments is Map<String, dynamic>) {
      entity = arguments['movie'] ?? arguments['browse'] ?? arguments['search'];
    } else {
      entity = arguments;
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeroSection(entity),
              _buildContentSection(entity),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(dynamic entity) {
    return SizedBox(
      width: double.infinity,
      height: 645.h,
      child: Stack(
        children: [
          // Movie poster
          Positioned.fill(
            child: Image.network(
              getLargeCover(entity) ?? getMediumCover(entity) ?? '',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[300],
                child: const Icon(Icons.movie, size: 100, color: Colors.grey),
              ),
            ),
          ),

          // Gradient overlay
          Positioned.fill(
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
          ),

          // Back button
          Positioned(
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
          ),

          // Bookmark button
          Positioned(
            top: 29.h,
            right: 16.w,
            child: GestureDetector(
              onTap: () => setState(() => isBookmarked = !isBookmarked),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.white,
                  size: 24.w,
                ),
              ),
            ),
          ),

          // Movie title and year
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 20.h,
            child: Column(
              children: [
                Text(
                  getTitle(entity),
                  style: AppStyles.mainStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  getYear(entity).toString(),
                  style: AppStyles.year,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection(dynamic entity) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Watch button
          CustomElevatedButton(
            label: 'Watch',
            onTap: () {},
            backgroundColor: ColorsManager.red,
            textStyle: AppStyles.elevatedButton.copyWith(color: ColorsManager.white),
          ),

          SizedBox(height: 18.h),

          // Movie stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InformationBox(title: getRating(entity).toStringAsFixed(1), iconImage: ImageAssets.star),
              InformationBox(title: '${getRuntime(entity)} min', iconImage: ImageAssets.clock),
              InformationBox(title: getYear(entity).toString(), iconImage: ImageAssets.heart),
            ],
          ),

          SizedBox(height: 18.h),

          // Screenshots
          Text('Screenshots', style: AppStyles.mainStyle),
          SizedBox(height: 18.h),
          SizedBox(
            height: 150.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: ScreenShotList(imageUrl: getLargeCover(entity) ?? ImageAssets.screenShot),
              ),
            ),
          ),

          SizedBox(height: 18.h),

          // Similar movies
          Text('Similar Movies', style: AppStyles.mainStyle),
          SizedBox(height: 18.h),
          BlocProvider(
            create: (context) => serviceLocator.get<HomeCubit>()
              ..getMoviesByGenre(getGenres(entity).isNotEmpty ? getGenres(entity).first : "action"),
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

          SizedBox(height: 18.h),

          // Summary
          Text('Summary', style: AppStyles.mainStyle),
          SizedBox(height: 18.h),
          Text(
            getSummary(entity),
            style: AppStyles.description,
          ),

          SizedBox(height: 18.h),

          // Cast
          Text('Cast', style: AppStyles.mainStyle),
          SizedBox(height: 18.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => const CastBox(),
            itemCount: 4,
          ),
        ],
      ),
    );
  }
}