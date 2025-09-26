import 'package:flutter/material.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/entity_converter.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/information_box.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';

class MovieStatsRow extends StatelessWidget {
  final dynamic entity;

  const MovieStatsRow({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InformationBox(
          title: EntityConverter.getRating(entity).toStringAsFixed(1),
          iconImage: ImageAssets.star,
        ),
        InformationBox(
          title: '${EntityConverter.getRuntime(entity)}',
          iconImage: ImageAssets.clock,
        ),
        InformationBox(
          title: EntityConverter.getYear(entity).toString(),
          iconImage: ImageAssets.heart,
        ),
      ],
    );
  }
}