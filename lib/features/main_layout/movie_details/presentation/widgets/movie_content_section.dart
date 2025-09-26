import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/entity_converter.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/movie_states.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/similar_movies_section.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';
import 'package:movies_v2/shared/widgets/custom_elevated_button.dart';

class MovieContentSection extends StatelessWidget {
  final dynamic entity;

  const MovieContentSection({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWatchButton(),
          SizedBox(height: 18.h),
          MovieStatsRow(entity: entity),
          SizedBox(height: 18.h),
          _buildSummarySection(),
          SizedBox(height: 18.h),
          SimilarMoviesSection(entity: entity),
        ],
      ),
    );
  }

  Widget _buildWatchButton() {
    return CustomElevatedButton(
      label: 'Watch',
      onTap: () {},
      backgroundColor: ColorsManager.red,
      textStyle: AppStyles.elevatedButton.copyWith(color: ColorsManager.white),
    );
  }

  Widget _buildSummarySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Summary', style: AppStyles.mainStyle),
        SizedBox(height: 18.h),
        Text(
          EntityConverter.getSummary(entity),
          style: AppStyles.description,
        ),
      ],
    );
  }
}