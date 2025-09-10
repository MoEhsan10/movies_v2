import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/home/domain/entites/movie_entity.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/widgets/movies_list.dart';
import 'package:movies_v2/shared/routes_manager/routes.dart';
import '../../../../../shared/resources/colors_manager.dart';

class MoviesCategory extends StatelessWidget {
  const MoviesCategory({
    super.key,
    required this.genreName,
    required this.movies,
    this.genreId,
    this.onSeeMoreTap,
  });

  final String genreName;
  final List<MovieEntity> movies;
  final String? genreId;
  final VoidCallback? onSeeMoreTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(bottom: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                genreName,
                style: AppStyles.categoryName,
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    'See More',
                    style: AppStyles.suggestion.copyWith(fontSize: 16.sp),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: ColorsManager.yellow,
                    size: 16,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 13.h),
          SizedBox(
            height: 220.h,
            child: movies.isNotEmpty
                ? ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length > 10 ? 10 : movies.length,
              separatorBuilder: (context, index) => SizedBox(width: 12.w),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.movieDetails,
                    arguments: movies[index],
                  );
                },
                child: MoviesList(
                  movie: movies[index],
                  rating: movies[index].rating.toString(),
                  imageUrl: movies[index].mediumCoverImage,
                ),
              ),
            )
                : Center(
              child: Text(
                'No movies available',
                style: AppStyles.suggestion,
              ),
            ),
          )
        ],
      ),
    );
  }
}