import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/cast_box.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/information_box.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/screen_shot_list.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';
import 'package:movies_v2/shared/widgets/custom_elevated_button.dart';
import 'package:movies_v2/shared/widgets/movies_list.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.infinity,
              height: 645.h,
              child: Stack(
                children: [
                  // Movie poster - full width
                  Positioned.fill(
                    child: Image.asset(
                      ImageAssets.marvel,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit
                          .cover, // This ensures the image covers the entire area
                    ),
                  ),

                  // Top overlay with gradient for better text visibility
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                          stops: const [0.0, 0.3, 0.6, 1.0],
                        ),
                      ),
                    ),
                  ),

                  // Save icon - positioned from right edge
                  Positioned(
                    top: 29.h,
                    right: 16.w,
                    // Changed from left to right for better positioning
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: ImageIcon(
                        const AssetImage(ImageAssets.save),
                        color: Colors.white,
                        size: 24.w,
                      ),
                    ),
                  ),

                  // Icon Back
                  Positioned(
                    top: 29.h,
                    left: 16.w,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 24.w,
                        ),
                      ),
                    ),
                  ),

                  // Play icon - centered
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 100.h,
                    // Leave space for text at bottom
                    child: const Center(
                      child: Icon(
                        Icons.play_circle,
                        color: ColorsManager.yellow,
                        size: 97,
                      ),
                    ),
                  ),

                  // Movie title - with proper text wrapping
                  Positioned(
                    left: 20.w,
                    right: 20.w, // Added right constraint to prevent overflow
                    bottom: 60.h, // Position from bottom instead of top
                    child: Text(
                      'Doctor Strange in the Multiverse of Madness',
                      style: AppStyles.mainStyle,
                      maxLines: 2, // Allow text to wrap to 2 lines
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center, // Handle overflow gracefully
                    ),
                  ),

                  // Year
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 20.h,
                    child: Text(
                      '2022',
                      style: AppStyles.year,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: REdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomElevatedButton(
                    label: 'Watch',
                    onTap: () {},
                    backgroundColor: ColorsManager.red,
                    textStyle: AppStyles.elevatedButton
                        .copyWith(color: ColorsManager.white),
                  ),
                  SizedBox(height: 18.h),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InformationBox(title: '15', iconImage: ImageAssets.heart),
                      InformationBox(title: '90', iconImage: ImageAssets.clock),
                      InformationBox(title: '7.7', iconImage: ImageAssets.star),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    'Screen Shots',
                    style: AppStyles.mainStyle,
                  ),
                  SizedBox(height: 18.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => const ScreenShotList(
                      imageUrl: ImageAssets.screenShot,
                    ),
                    itemCount: 3,

                  ),
                  SizedBox(height: 18.h),

                  Text(
                    'Similar',
                    style: AppStyles.mainStyle,
                  ),
                  SizedBox(height: 18.h),
                  GridView.builder(
                      shrinkWrap: true, // Add this
                      physics: const NeverScrollableScrollPhysics(), // Add this
                      itemCount: 6, // Add itemCount - adjust as needed
                      itemBuilder: (context, index) => const MoviesList(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20.w,
                        mainAxisSpacing: 18.h,
                        crossAxisCount: 2,
                        childAspectRatio: 0.7, )),


                  SizedBox(height: 18.h),

                  Text(
                    'Summary',
                    style: AppStyles.mainStyle,
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346',
                    style: AppStyles.description,
                  ),



                  SizedBox(height: 18.h),

                  Text(
                    'Cast',
                    style: AppStyles.mainStyle,
                  ),
                  SizedBox(height: 18.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => const CastBox(),
                    itemCount: 4,
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
