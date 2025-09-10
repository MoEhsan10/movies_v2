import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/home/domain/entites/movie_entity.dart';
import 'package:movies_v2/shared/routes_manager/routes.dart';
import 'package:movies_v2/shared/widgets/rating_box.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
    this.rating = '0.0',
    this.imageUrl,
    required this.movie,
  });

  final String rating;
  final String? imageUrl;
  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: AspectRatio(
        aspectRatio: 146 / 220,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.movieDetails,
              arguments: movie,
            );
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(
                  imageUrl ?? ImageAssets.blackWindow,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: RatingBox(rating: rating),
              ),
            ],
          ),
        ),
      ),
    );
  }
}