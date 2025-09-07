import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';

class CastBox extends StatelessWidget {
  const CastBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      margin: REdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: ColorsManager.darkGrey,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                ImageAssets.cast,
                width: 70.w,
                height: 70.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Name: ', style: AppStyles.castName),
                      Expanded( // Changed back to Expanded for better space usage
                        child: Text(
                          'Charlize Theron',
                          style: AppStyles.castName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1, // Ensure single line
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text('Character: ', style: AppStyles.castName),
                      Expanded( // Changed back to Expanded for better space usage
                        child: Text(
                          'Clea',
                          style: AppStyles.castName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1, // Ensure single line
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}