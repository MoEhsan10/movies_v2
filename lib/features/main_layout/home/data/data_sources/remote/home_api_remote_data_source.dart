import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:movies_v2/features/main_layout/home/data/mappers/movies_list_mapper.dart';
import 'package:movies_v2/features/main_layout/home/domain/entites/movie_entity.dart';
import 'package:movies_v2/shared/error/exceptions.dart';
import 'package:movies_v2/shared/models/MoviesListModel.dart';
import 'package:movies_v2/shared/resources/app_constants.dart';

@Singleton(as: HomeRemoteDataSource)
class HomeApiRemoteDataSource  implements HomeRemoteDataSource{

  final Dio _dio;

  const HomeApiRemoteDataSource(this._dio);

  @override
  Future<List<MovieEntity>> getMoviesByCategory(String genre) async{
    try{
      final response = await _dio.get(ApiConstants.moviesListEndpoint,
        queryParameters: {
          "genre": genre,
        },
      );
      final moviesList = MoviesListModel.fromJson(response.data);
      return moviesList.toMovieEntityList;
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Failed to get Movies');
    }
  }


}