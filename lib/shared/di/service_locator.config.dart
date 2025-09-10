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
import 'package:movies_v2/features/main_layout/home/data/data_sources/home_api_remote_data_source.dart'
    as _i428;
import 'package:movies_v2/features/main_layout/home/data/data_sources/home_remote_data_source.dart'
    as _i824;
import 'package:movies_v2/features/main_layout/home/data/repositories/home_repository_impl.dart'
    as _i498;
import 'package:movies_v2/features/main_layout/home/domain/repositories/home_repository.dart'
    as _i787;
import 'package:movies_v2/features/main_layout/home/domain/use_cases/get_movies_by_category_use_case.dart'
    as _i64;
import 'package:movies_v2/features/main_layout/home/presentation/cubit/home_/home_cubit.dart'
    as _i991;
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
    gh.singleton<_i824.HomeRemoteDataSource>(
        () => _i428.HomeApiRemoteDataSource(gh<_i361.Dio>()));
    gh.singleton<_i787.HomeRepository>(
        () => _i498.HomeRepositoryImpl(gh<_i824.HomeRemoteDataSource>()));
    gh.singleton<_i64.GetMoviesByCategoryUseCase>(
        () => _i64.GetMoviesByCategoryUseCase(gh<_i787.HomeRepository>()));
    gh.singleton<_i991.HomeCubit>(
        () => _i991.HomeCubit(gh<_i64.GetMoviesByCategoryUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i885.NetworkModule {}
