import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';

class InformationBox extends StatelessWidget {
  const InformationBox({super.key, required this.title, required this.iconImage,});

 final String title;
 final String iconImage;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(3),
      width: 122.w,
      height: 47.h,
      decoration: BoxDecoration(
        color: ColorsManager.darkGrey,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content
        children: [
          SizedBox(
            width: 28.w, // Control star icon size
            height: 28.h,
            child: Image.asset(iconImage),
          ),

          SizedBox(width: 6.w),
          Text(
              title,
              style : AppStyles.mainStyle
          ),
        ],
      ),
    );
  }
}
