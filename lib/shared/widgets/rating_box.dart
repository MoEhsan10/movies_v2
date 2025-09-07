import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(3),
      width: 58.w,
      height: 28.h,
      decoration: BoxDecoration(
        color: ColorsManager.darkGrey,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content
        children: [
          const Text(
            '7.7',
            style: TextStyle(
              color: ColorsManager.white,
              decoration: TextDecoration.none,
              fontSize: 12, // Add font size for consistency
            ),
          ),
          SizedBox(width: 3.w),
          SizedBox(
            width: 13.w, // Control star icon size
            height: 13.h,
            child: Image.asset(ImageAssets.star),
          ),
        ],
      ),
    );
  }
}
