import 'package:flutter/material.dart';
import 'package:movies_v2/features/main_layout/home/presentation/screens/home_screen.dart';
import 'package:movies_v2/features/main_layout/on_boarding/widgets/on_boarding_bottom_sheet.dart';
import 'package:movies_v2/features/main_layout/on_boarding/widgets/on_boarding_data.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;
  int currentPage = 0;

  // Page content data
  final List<Map<String, dynamic>> pageContent = [
    {
      'title': 'Find Your Next Favorite Movie Here',
      'subtitle': 'Get access to a huge library of movies to suit all tastes. You will surely like it.',
      'buttonText': 'Explore Now',
    },
    {
      'title': 'Discover Movies',
      'subtitle': 'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
      'buttonText': 'Next',
    },
    {
      'title': 'Explore All Genres',
      'subtitle': 'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
      'buttonText': 'Next',
    },
    {
      'title': 'Create Watchlists',
      'subtitle': 'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
      'buttonText': 'Next',
    },
    {
      'title': 'Rate, Review, and Learn',
      'subtitle': "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
      'buttonText': 'Discover',
    },
    {
      'title': 'Start Watching Now',
      'subtitle': '',
      'buttonText': 'Finish',
    },
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
      isLastPage = index == pageContent.length - 1;
    });
  }

  void nextPage() {
    if (isLastPage) {
      // Navigate to main app
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    } else {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void skipToEnd() {
    controller.animateToPage(
      pageContent.length - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: onPageChanged,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              OnBoardingData(
                color: ColorsManager.black,
                urlImage: ImageAssets.moviePosters,
              ),
              OnBoardingData(
                color: ColorsManager.black,
                urlImage: ImageAssets.marvel2,
              ),
              OnBoardingData(
                color: ColorsManager.black,
                urlImage: ImageAssets.godFather,
              ),
              OnBoardingData(
                color: ColorsManager.black,
                urlImage: ImageAssets.badBoys,
              ),
              OnBoardingData(
                color: ColorsManager.black,
                urlImage: ImageAssets.marvel,
              ),
              OnBoardingData(
                color: ColorsManager.black,
                urlImage: ImageAssets.warMovie1917,
              ),
            ],
          ),

          // Skip button
          // if (!isLastPage)
          //   Positioned(
          //     top: 50.h,
          //     right: 20.w,
          //     child: TextButton(
          //       onPressed: skipToEnd,
          //       child: Text(
          //         'Skip',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 16.sp,
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
      bottomSheet: OnBoardingBottomSheet(
        currentPage: currentPage,
        totalPages: pageContent.length,
        pageContent: pageContent[currentPage],
        isLastPage: isLastPage,
        onNext: nextPage,
        onPrevious: currentPage > 0 ? previousPage : null,
      ),
    );
  }
}