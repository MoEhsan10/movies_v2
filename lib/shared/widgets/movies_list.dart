import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/browse/domain/entities/browse_entity.dart';
import 'package:movies_v2/features/main_layout/home/domain/entites/movie_entity.dart';
import 'package:movies_v2/features/main_layout/search/domain/entities/search_entity.dart';
import 'package:movies_v2/shared/routes_manager/routes.dart';
import 'package:movies_v2/shared/widgets/rating_box.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    super.key,
    this.rating = '0.0',
    this.imageUrl,
    this.movie,
    this.browse,
    this.searchEntity,
  });

  final String rating;
  final String? imageUrl;
  final MovieEntity? movie;
  final BrowseEntity? browse;
  final SearchEntity? searchEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: AspectRatio(
        aspectRatio: 146 / 220,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.movieDetails,
              arguments: {
                'movie': movie,
                'browse': browse,
                'search': searchEntity,
              },
            );
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(
                  imageUrl ?? ImageAssets.blackWindow,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: const Icon(Icons.movie, size: 50, color: Colors.grey),
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: RatingBox(rating: rating),
              ),
            ],
          ),
        ),
      ),
    );
  }
}