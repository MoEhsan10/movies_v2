import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/browse/presentation/widgets/tab_item.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  int selectedTabIndex = 0;

  final List<String> categories = [
    'Action', 'Comedy', 'Drama', 'Horror', 'Romance',
    'Sci-Fi', 'Thriller', 'Adventure', 'Animation', 'Documentary'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Custom TabBar with reduced spacing
          Container(
            padding: REdgeInsets.all(16),
            height: 80.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (context, index) => SizedBox(width: 8.w), // Reduced spacing
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    selectedTabIndex = index;
                    setState(() {});
                  },
                  child: TabItem(
                    categoryName: categories[index],
                    isSelected: selectedTabIndex == index,
                  ),
                );
              },
            ),
          ),

          // Centered Grid
          // Expanded(
          //   child: Center(
          //     child: GridView.builder(
          //       shrinkWrap: true,
          //       physics: const BouncingScrollPhysics(),
          //       padding: REdgeInsets.symmetric(horizontal: 20,vertical: 15), // Add horizontal padding for centering
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2,
          //         crossAxisSpacing: 10.w,
          //         mainAxisSpacing: 16.h,
          //         childAspectRatio: 0.7, // Adjust based on your MoviesList widget
          //       ),
          //       itemCount: 6, // Adjust item count as needed
          //       itemBuilder: (context, index) => SizedBox(
          //           width: 189.w,
          //           height: 279.h,
          //           child: const MoviesList()),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}