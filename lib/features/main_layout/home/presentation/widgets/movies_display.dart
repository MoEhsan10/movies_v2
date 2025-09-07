import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/widgets/rating_box.dart';


class MoviesDisplay extends StatelessWidget {
  const MoviesDisplay({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 234.w,
      height: 352.h, // Fixed height to match your original design
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
              child: Image.asset(
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
            child: const RatingBox(),
          ),
        ],
      ),
    );
  }
}