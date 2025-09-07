import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/routes_manager/routes.dart';
import 'package:movies_v2/shared/widgets/rating_box.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: AspectRatio(
        aspectRatio: 146 / 220, // Maintain your desired aspect ratio
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.movieDetails);
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  ImageAssets.blackWindow,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: const RatingBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}