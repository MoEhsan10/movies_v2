import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';

class ProfileLabels extends StatelessWidget {
  const ProfileLabels({super.key,});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 30.h),
          // Numbers Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '12',
                style: TextStyle(
                  color: ColorsManager.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 32.sp,
                ),
              ),
              Text(
                '10',
                style: TextStyle(
                  color: ColorsManager.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 32.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Labels Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Watch List',
                style: TextStyle(
                  color: ColorsManager.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(width: 15.h),
              Text(
                'History',
                style: TextStyle(
                  color: ColorsManager.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
