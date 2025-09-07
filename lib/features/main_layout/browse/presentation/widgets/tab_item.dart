import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';

class TabItem extends StatelessWidget {
  const TabItem(
      {super.key, required this.categoryName, required this.isSelected});

  final String categoryName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 132.w,
      height: 48.h,
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.yellow : ColorsManager.black,
        borderRadius: BorderRadius.circular(16.r),
        border: isSelected
            ? null
            : Border.all(
          color: ColorsManager.yellow,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          categoryName,
          style: isSelected
              ? TextStyle(color: ColorsManager.black)
              : TextStyle(color: ColorsManager.yellow),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}