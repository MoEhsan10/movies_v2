import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';

class OnBoardingBottomSheet extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Map<String, dynamic> pageContent;
  final bool isLastPage;
  final VoidCallback onNext;
  final VoidCallback? onPrevious;

  const OnBoardingBottomSheet({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.pageContent,
    required this.isLastPage,
    required this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(37.r),
          topRight: Radius.circular(37.r),
        ),
        border: Border.all(
          color: ColorsManager.black,
          width: 1,
        ),
      ),
      child: Padding(
        padding: REdgeInsets.fromLTRB(20, 20, 20, 30), // Added bottom padding for safe area
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Page indicator dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                totalPages,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: REdgeInsets.symmetric(horizontal: 4),
                  height: 8.h,
                  width: currentPage == index ? 24.w : 8.w,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? ColorsManager.yellow
                        : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),

            SizedBox(height: 24.h),

            // Content for current page
            Column(
              children: [
                Text(
                  pageContent['title'],
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                Text(
                  pageContent['subtitle'],
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            SizedBox(height: 32.h),

            // Action buttons
            Column(
              children: [
                // Main action button
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.yellow,
                      foregroundColor: ColorsManager.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                    ),
                    child: Text(
                      pageContent['buttonText'],
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // Back button (only show if not first page)
                if (onPrevious != null) ...[
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: OutlinedButton(
                      onPressed: onPrevious,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white70,
                        side: const BorderSide(
                          color: ColorsManager.yellow,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                      ),
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: ColorsManager.yellow,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}