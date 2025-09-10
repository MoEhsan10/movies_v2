import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/home/domain/entites/movie_entity.dart';
import 'package:movies_v2/shared/widgets/rating_box.dart';


class MoviesDisplay extends StatelessWidget {
  const MoviesDisplay({super.key, required this.imageUrl, required this.rating, this.movies});

  final String imageUrl;
  final String rating;
  final MovieEntity? movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 234.w,
      height: 352.h,
      child: Stack(
        children: [
          Container(
            width: 234.w,
            height: 352.h, // Specify the height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: 234.w,
                height: 352.h, // Specify image dimensions
              ),
            ),
          ),
          Positioned(
            top: 11.h,
            left: 9.w,
            child: RatingBox(rating: rating,),
          ),
        ],
      ),
    );
  }
}