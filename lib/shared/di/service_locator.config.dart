// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movies_v2/features/main_layout/browse/data/data_sources/remote/browse_api_remote_data_source.dart'
    as _i778;
import 'package:movies_v2/features/main_layout/browse/data/data_sources/remote/browse_remote_data_source.dart'
    as _i240;
import 'package:movies_v2/features/main_layout/browse/data/repositories/browse_repository_impl.dart'
    as _i135;
import 'package:movies_v2/features/main_layout/browse/domain/repositories/browse_repository.dart'
    as _i989;
import 'package:movies_v2/features/main_layout/browse/domain/use_cases/get_movies_by_genre_use_case.dart'
    as _i126;
import 'package:movies_v2/features/main_layout/browse/presentation/cubit/browse_cubit.dart'
    as _i718;
import 'package:movies_v2/features/main_layout/home/data/data_sources/remote/home_api_remote_data_source.dart'
    as _i49;
import 'package:movies_v2/features/main_layout/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i607;
import 'package:movies_v2/features/main_layout/home/data/repositories/home_repository_impl.dart'
    as _i498;
import 'package:movies_v2/features/main_layout/home/domain/repositories/home_repository.dart'
    as _i787;
import 'package:movies_v2/features/main_layout/home/domain/use_cases/get_movies_by_category_use_case.dart'
    as _i64;
import 'package:movies_v2/features/main_layout/home/presentation/cubit/home_/home_cubit.dart'
    as _i991;
import 'package:movies_v2/features/main_layout/search/data/data_sourcess/remote/search_api_remote_data_source.dart'
    as _i638;
import 'package:movies_v2/features/main_layout/search/data/data_sourcess/remote/search_remote_data_source.dart'
    as _i418;
import 'package:movies_v2/features/main_layout/search/data/repositories/search_repository_impl.dart'
    as _i925;
import 'package:movies_v2/features/main_layout/search/domain/repositories/search_repository.dart'
    as _i295;
import 'package:movies_v2/features/main_layout/search/presentation/cubit/search_cubit.dart'
    as _i57;
import 'package:movies_v2/shared/di/network_module.dart' as _i885;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.singleton<_i361.Dio>(() => networkModule.dio);
    gh.singleton<_i607.HomeRemoteDataSource>(
        () => _i49.HomeApiRemoteDataSource(gh<_i361.Dio>()));
    gh.singleton<_i240.BrowseRemoteDataSource>(
        () => _i778.BrowseApiRemoteDataSource(gh<_i361.Dio>()));
    gh.singleton<_i418.SearchRemoteDataSource>(
        () => _i638.SearchApiRemoteDataSource(gh<_i361.Dio>()));
    gh.singleton<_i295.SearchRepository>(
        () => _i925.SearchRepositoryImpl(gh<_i418.SearchRemoteDataSource>()));
    gh.singleton<_i989.BrowseRepository>(
        () => _i135.BrowseRepositoryImpl(gh<_i240.BrowseRemoteDataSource>()));
    gh.singleton<_i57.SearchCubit>(
        () => _i57.SearchCubit(gh<_i295.SearchRepository>()));
    gh.factory<_i718.BrowseCubit>(
        () => _i718.BrowseCubit(gh<_i989.BrowseRepository>()));
    gh.singleton<_i787.HomeRepository>(
        () => _i498.HomeRepositoryImpl(gh<_i607.HomeRemoteDataSource>()));
    gh.singleton<_i126.GetMoviesByGenreUseCase>(
        () => _i126.GetMoviesByGenreUseCase(gh<_i989.BrowseRepository>()));
    gh.singleton<_i64.GetMoviesByCategoryUseCase>(
        () => _i64.GetMoviesByCategoryUseCase(gh<_i787.HomeRepository>()));
    gh.singleton<_i991.HomeCubit>(
        () => _i991.HomeCubit(gh<_i64.GetMoviesByCategoryUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i885.NetworkModule {}
