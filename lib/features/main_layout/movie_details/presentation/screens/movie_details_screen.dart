import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/home/domain/entites/movie_entity.dart';
import 'package:movies_v2/features/main_layout/browse/domain/entities/browse_entity.dart';
import 'package:movies_v2/features/main_layout/home/presentation/cubit/home_/home_cubit.dart';
import 'package:movies_v2/features/main_layout/home/presentation/cubit/home_/home_states.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/cast_box.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/information_box.dart';
import 'package:movies_v2/features/main_layout/movie_details/presentation/widgets/screen_shot_list.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/di/service_locator.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';
import 'package:movies_v2/shared/widgets/custom_elevated_button.dart';
import 'package:movies_v2/shared/widgets/error_indicator.dart';
import 'package:movies_v2/shared/widgets/loading_indicator.dart';
import 'package:movies_v2/shared/widgets/movies_list.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final movie = args['browse'] ?? args['movie'];

    String title = "";
    String image = "";
    int year = 0;
    double rating = 0.0;
    int runtime = 0;
    String summary = "No summary available";

    if (movie is MovieEntity) {
      title = movie.title ;
      image = movie.largeCoverImage ?? "";
      year = movie.year ;
      rating = movie.rating ;
      runtime = movie.runtime ;
      summary = movie.summary ?? "No summary available";
    } else if (movie is BrowseEntity) {
      title = movie.title;
      image = movie.largeCoverImage ?? "";
      year = movie.year;
      rating = movie.rating ;
      runtime = movie.runtime;
      summary = movie.summary ?? "No summary available";
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.infinity,
              height: 645.h,
              child: Stack(
                children: [
                  // Movie poster - full width
                  Positioned.fill(
                    child: Image.network(
                      image,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey,
                          child: const Icon(Icons.movie, size: 100),
                        );
                      },
                    ),
                  ),

                  // Top overlay with gradient for better text visibility
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                          stops: const [0.0, 0.3, 0.6, 1.0],
                        ),
                      ),
                    ),
                  ),

                  // Save icon - positioned from right edge
                  Positioned(
                    top: 29.h,
                    right: 16.w,
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: ImageIcon(
                        const AssetImage(ImageAssets.save),
                        color: Colors.white,
                        size: 24.w,
                      ),
                    ),
                  ),

                  // Icon Back
                  Positioned(
                    top: 29.h,
                    left: 16.w,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 24.w,
                        ),
                      ),
                    ),
                  ),

                  // Movie title - with proper text wrapping
                  Positioned(
                    left: 20.w,
                    right: 20.w,
                    bottom: 60.h,
                    child: Text(
                      title,
                      style: AppStyles.mainStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // Year
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 20.h,
                    child: Text(
                      year.toString(),
                      style: AppStyles.year,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: REdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomElevatedButton(
                    label: 'Watch',
                    onTap: () {},
                    backgroundColor: ColorsManager.red,
                    textStyle: AppStyles.elevatedButton
                        .copyWith(color: ColorsManager.white),
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const InformationBox(title: '15', iconImage: ImageAssets.heart),
                      InformationBox(title: runtime.toString(), iconImage: ImageAssets.clock),
                      InformationBox(title: rating.toString(), iconImage: ImageAssets.star),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    'Screen Shots',
                    style: AppStyles.mainStyle,
                  ),
                  SizedBox(height: 18.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => const ScreenShotList(
                      imageUrl: ImageAssets.screenShot,
                    ),
                    itemCount: 3,
                  ),
                  SizedBox(height: 18.h),

                  Text(
                    'Similar',
                    style: AppStyles.mainStyle,
                  ),
                  SizedBox(height: 18.h),
                  BlocProvider(
                    create: (context) => serviceLocator.get<HomeCubit>()..getMoviesByGenre(""),
                    child: BlocBuilder<HomeCubit, HomeStates>(
                      builder: (context, state) {
                        if(state is GetMoviesByGenreLoading){
                          return const LoadingIndicator();
                        }else if(state is GetMoviesByGenreError){
                          return ErrorIndicator(message: state.message);
                        }else if(state is GetMoviesByGenreSuccess){
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.movies.length > 6 ? 6 : state.movies.length,
                            itemBuilder: (context, index) =>
                                MoviesList(
                                  movie: state.movies[index],
                                  rating: state.movies[index].rating.toString(),
                                  imageUrl: state.movies[index].mediumCoverImage,
                                ),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 20.w,
                              mainAxisSpacing: 18.h,
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                            ),
                          );
                        }else{
                          return const SizedBox();
                        }
                      },
                    ),
                  ),

                  SizedBox(height: 18.h),

                  Text(
                    'Summary',
                    style: AppStyles.mainStyle,
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    summary,
                    style: AppStyles.description,
                  ),

                  SizedBox(height: 18.h),

                  Text(
                    'Cast',
                    style: AppStyles.mainStyle,
                  ),
                  SizedBox(height: 18.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => const CastBox(),
                    itemCount: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}