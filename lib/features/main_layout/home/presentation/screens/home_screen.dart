import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/browse/presentation/screens/browse_tab.dart';
import 'package:movies_v2/features/main_layout/home/presentation/screens/home_tab.dart';
import 'package:movies_v2/features/main_layout/profile/presentation/screens/profile_tab.dart';
import 'package:movies_v2/features/main_layout/search/presentation/screens/search_tab.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const BrowseTab(),
    const ProfileTab(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        margin:  REdgeInsets.all(9),
        decoration: BoxDecoration(
          color: ColorsManager.darkGrey,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(ImageAssets.home)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(ImageAssets.search)),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(ImageAssets.browse)),
                label: 'Browse',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(ImageAssets.person)),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}