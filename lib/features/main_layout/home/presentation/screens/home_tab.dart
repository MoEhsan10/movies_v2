import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/home/presentation/widgets/background_image.dart';
import 'package:movies_v2/features/main_layout/home/presentation/widgets/movies_category.dart';
import 'package:movies_v2/features/main_layout/home/presentation/widgets/movies_display.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/routes_manager/routes.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final controller = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Give Stack a specific height that accommodates both elements
          SizedBox(
            height: 650.h, // Increased height to accommodate "Watch Now"
            width: double.infinity,
            child: Stack(
              children: [
                // Background image with shadow overlay
                const BackgroundImage(),
                Positioned(
                  top: 121.h,
                  left: 20.w,
                  child: SizedBox(
                    height: 352.h,
                    width: 1.sw - 40.w, // Account for margins
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.movieDetails);
                      },
                      child: ListView.separated(
                        itemCount: 6,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 24.w),
                        itemBuilder: (context, index) =>
                            const MoviesDisplay(imageUrl: ImageAssets.warMovie1917),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                ),
                // "Available"
                Positioned(
                  top: 7.h,
                  left: 82.w,
                  child: Image.asset(
                    ImageAssets.available,
                    width: 267.w,
                    height: 93.h,
                  ),
                ),
                // "Watch Now"
                Positioned(
                  bottom: 30.h,
                  left: 38.w,
                  child: Image.asset(
                    ImageAssets.watchNow,
                    width: 354.w,
                    height: 146.h,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: REdgeInsets.all(16),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const MoviesCategory(),
                  itemCount: 3,
                ),
                
               
              ],
            ),
          )
        ],
      ),
    );
  }
}
