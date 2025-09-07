import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/widgets/movies_list.dart';

import '../../../../../shared/resources/colors_manager.dart';

class MoviesCategory extends StatelessWidget {
  const MoviesCategory({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(bottom: 30.h),
      child: Column(
        children: [
           Row(
            children: [
              Text('Action', style: AppStyles.categoryName,
             ),
              const Spacer(),
              GestureDetector(
                onTap: () {

                },
                child:  Row(
                  children: [
                    Text('See More', style: AppStyles.suggestion.copyWith(fontSize: 16.sp),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorsManager.yellow,
                      size: 16,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 13.h),
          SizedBox(
            height: 220.h, // Fixed height for ListView
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (context, index) => SizedBox(width: 12.w),
              itemBuilder: (context, index) => const MoviesList(),
            ),
          )
        ],
      ),
    );
  }
}
