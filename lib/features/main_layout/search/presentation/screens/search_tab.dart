import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';
import 'package:movies_v2/shared/widgets/custom_text_form_field.dart';

class SearchTab extends StatelessWidget {
  SearchTab({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 21),
        child: Column(
          children: [
            CustomTextFormField(
              controller: controller,
              hintText: 'Search',
              hintStyle: const TextStyle(color: ColorsManager.white),
              prefixIcon: Padding(
                padding: REdgeInsets.all(12.0),
                child: Image.asset(
                  ImageAssets.search,
                  color: ColorsManager.white,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),

            Expanded(
              child: Center(
                child: Image.asset(
                  ImageAssets.empty,
                  width: 124.w,
                  height: 124.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}