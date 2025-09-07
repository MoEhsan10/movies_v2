import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/profile/presentation/widgets/profile_labels.dart';
import 'package:movies_v2/features/main_layout/profile/presentation/widgets/profile_tab_item.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';
import 'package:movies_v2/shared/routes_manager/routes.dart';
import 'package:movies_v2/shared/widgets/custom_elevated_button.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: ColorsManager.darkGrey,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h), // Reduced horizontal padding
            child: Column(
              children: [
                SizedBox(height: 20.h),

                // Main Row: Avatar on left, Stats on right
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 55.w,
                          backgroundImage: const AssetImage(ImageAssets.gamerProfile),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                            'Mohamed Ehsan',
                            style: AppStyles.profileName
                        ),
                      ],
                    ),
                    SizedBox(width: 20.w), // Reduced width
                    const Expanded(child: ProfileLabels()),
                  ],
                ),
                SizedBox(height: 12.h),

                // Buttons Row
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        label: 'Edit Profile',
                        onTap: () {
                          Navigator.pushNamed(context, Routes.edit);
                        },
                        backgroundColor: ColorsManager.yellow,
                        foregroundColor: ColorsManager.black,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    CustomElevatedButton(
                      label: 'Exit',
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Routes.login);
                      },
                      backgroundColor: ColorsManager.red,
                      foregroundColor: ColorsManager.white,
                      textStyle: AppStyles.elevatedButton.copyWith(
                        color: ColorsManager.white,
                      ),
                      suffixIcon: const Icon(
                        Icons.exit_to_app,
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),

                // Spacer to push tabs to bottom of container
                SizedBox(height: 40.h),

                // Custom Tab Bar at bottom of container
                Row(
                  children: [
                    Expanded(
                      child: ProfileTabItem(
                        isSelected: selectedTabIndex == 0,
                        index: 0,
                        title: 'Watch List',
                        imageUrl: ImageAssets.options,
                        onTap: () {
                          setState(() {
                            selectedTabIndex = 0;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ProfileTabItem(
                        isSelected: selectedTabIndex == 1,
                        index: 1,
                        title: 'History',
                        imageUrl: ImageAssets.folder,
                        onTap: () {
                          setState(() {
                            selectedTabIndex = 1;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Centered empty state with responsive sizing
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 60.h),
            child: Center(
              child: Image.asset(
                ImageAssets.empty,
                width: 124.w,
                height: 124.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}