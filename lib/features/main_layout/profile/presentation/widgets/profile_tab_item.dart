import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';

class ProfileTabItem extends StatelessWidget {
  const ProfileTabItem({
    super.key,
    required this.index,
    required this.title,
    required this.imageUrl,
    required this.isSelected,
    required this.onTap, // Added required onTap callback
  });

  final int index;
  final String title;
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap; // Callback to parent

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call parent's callback
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageIcon(
            AssetImage(imageUrl),
            size: 22.w,
            color: isSelected ? ColorsManager.yellow : ColorsManager.white,
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? ColorsManager.yellow : ColorsManager.white,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              fontSize: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}