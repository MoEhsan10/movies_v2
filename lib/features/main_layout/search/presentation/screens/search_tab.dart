import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_v2/features/main_layout/search/presentation/cubit/search_cubit.dart';
import 'package:movies_v2/features/main_layout/search/presentation/cubit/search_state.dart';
import 'package:movies_v2/shared/config/theme/app_styles.dart';
import 'package:movies_v2/shared/di/service_locator.dart';
import 'package:movies_v2/shared/resources/assets_manager.dart';
import 'package:movies_v2/shared/resources/colors_manager.dart';
import 'package:movies_v2/shared/widgets/custom_text_form_field.dart';
import 'package:movies_v2/shared/widgets/error_indicator.dart';
import 'package:movies_v2/shared/widgets/loading_indicator.dart';
import 'package:movies_v2/shared/widgets/movies_list.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController controller = TextEditingController();
  late SearchCubit searchCubit;

  @override
  void initState() {
    super.initState();
    searchCubit = serviceLocator.get<SearchCubit>();

    controller.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    controller.removeListener(_onSearchChanged);
    controller.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (controller.text == _lastSearchText) {
        searchCubit.getMoviesBySearch(controller.text.trim());
      }
    });
    _lastSearchText = controller.text;
  }

  String _lastSearchText = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: searchCubit,
      child: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 21),
          child: Column(
            children: [
              CustomTextFormField(
                controller: controller,
                hintText: 'Search',
                hintStyle: AppStyles.hintText,
                style: AppStyles.hintText,
                prefixIcon: Padding(
                  padding: REdgeInsets.all(12.0),
                  child: Image.asset(
                    ImageAssets.search,
                    color: ColorsManager.white,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                suffixIcon: controller.text.isNotEmpty
                    ? IconButton(
                  onPressed: () {
                    controller.clear();
                    searchCubit.clearSearch();
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: ColorsManager.white,
                  ),
                )
                    : null,
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is GetMoviesBySearchLoading) {
                      return const Center(child: LoadingIndicator());
                    } else if (state is GetMoviesBySearchError) {
                      return Center(
                        child: ErrorIndicator(message: state.message),
                      );
                    } else if (state is GetMoviesBySearchSuccess) {
                      if (state.movies.isEmpty) {
                        return _buildEmptyState();
                      }
                      return _buildSearchResults(state);
                    } else {
                      return _buildInitialState();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults(GetMoviesBySearchSuccess state) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: REdgeInsets.symmetric(horizontal: 20, vertical: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.7,
      ),
      itemCount: state.movies.length,
      itemBuilder: (context, index) {
        final movie = state.movies[index];
        return SizedBox(
          width: 189.w,
          height: 279.h,
          child: MoviesList(
            searchEntity: movie,
            imageUrl: movie.largeCoverImage,
            rating: movie.rating.toString(),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageAssets.empty,
            width: 124.w,
            height: 124.w,
          ),
          SizedBox(height: 16.h),
          Text(
            'No movies found',
            style: TextStyle(
              color: ColorsManager.white,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Try searching with different keywords',
            style: TextStyle(
              color: ColorsManager.white.withOpacity(0.7),
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageAssets.empty,
            width: 124.w,
            height: 124.w,
          ),
          SizedBox(height: 16.h),
          Text(
            'Search for movies',
            style: TextStyle(
              color: ColorsManager.white,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}