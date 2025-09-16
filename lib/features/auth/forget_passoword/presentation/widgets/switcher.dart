import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';

class SlidingFlagSwitcher extends StatefulWidget {
  final Function(String)? onCountryChanged;

  const SlidingFlagSwitcher({
    super.key,
    this.onCountryChanged,
  });

  @override
  State<SlidingFlagSwitcher> createState() => _SlidingFlagSwitcherState();
}

class _SlidingFlagSwitcherState extends State<SlidingFlagSwitcher> {
  bool isEgypt = false; // Start with USA selected (left side)

  void _toggleCountry() {
    setState(() {
      isEgypt = !isEgypt;
    });
    widget.onCountryChanged?.call(isEgypt ? 'Egypt' : 'USA');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCountry,
      child:         Container(
        width: 120.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: ColorsManager.yellow,
            width: 3.w,
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Stack(
          children: [
            // Sliding yellow border indicator
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: isEgypt ? 65.w : 5.w, // Adjusted positioning for smaller circle
              top: 5.h,
              child: Container(
                width: 40.w, // Smaller width
                height: 40.h, // Smaller height
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsManager.yellow,
                    width: 2.w,
                  ),
                  borderRadius: BorderRadius.circular(20.r), // Adjusted radius
                ),
              ),
            ),
            // Flags row
            Row(
              children: [
                // USA Flag (left side)
                Expanded(
                  child: Center(
                    child: ImageIcon(
                      const AssetImage(ImageAssets.usa), // Using actual asset
                      size: 24.w,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Egypt Flag (right side)
                Expanded(
                  child: Center(
                    child: ImageIcon(
                      const AssetImage(ImageAssets.egypt), // Using actual asset
                      size: 24.w,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}