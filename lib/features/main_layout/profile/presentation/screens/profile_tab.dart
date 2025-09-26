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
    return Column(
      children: [
        // Top Profile Section with dark background
        Container(
          width: double.infinity,
          color: ColorsManager.darkGrey,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            children: [
              SizedBox(height: 20.h),

              // Profile Avatar and Name (Centered)
              Column(
                children: [
                  CircleAvatar(
                    radius: 40.w,
                    backgroundImage: const AssetImage(ImageAssets.gamerProfile),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                      'Mohamed Ehsan',
                      style: AppStyles.profileName
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // Stats Row (12 Wish List, 10 History)
                const ProfileLabels(),

              SizedBox(height: 24.h),

              // Buttons Row
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomElevatedButton(
                      label: 'Edit Profile',
                      onTap: () {
                        Navigator.pushNamed(context, Routes.edit);
                      },
                      backgroundColor: ColorsManager.yellow,
                      foregroundColor: ColorsManager.black,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomElevatedButton(
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
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // Custom Tab Bar
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

        // Content Area with empty state
        // Content Area with empty state
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 400.h, // Adjust height as needed
              color: ColorsManager.black,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageAssets.empty,
                      width: 120.w,
                      height: 120.h,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      selectedTabIndex == 0 ? 'No movies in watchlist' : 'No history found',
                      style: AppStyles.description,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}