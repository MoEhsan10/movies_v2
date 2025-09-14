import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/browse/data/data_sources/remote/browse_remote_data_source.dart';
import 'package:movies_v2/features/main_layout/browse/data/mappers/browse_mappers.dart';
import 'package:movies_v2/features/main_layout/browse/domain/entities/browse_entity.dart';
import 'package:movies_v2/shared/error/exceptions.dart';
import 'package:movies_v2/shared/models/MoviesListModel.dart';
import 'package:movies_v2/shared/resources/app_constants.dart';

@Singleton(as: BrowseRemoteDataSource)
class BrowseApiRemoteDataSource implements BrowseRemoteDataSource{

  final Dio _dio;

  BrowseApiRemoteDataSource(this._dio);


  @override
  Future<List<BrowseEntity>> getMoviesByGenre(String genre) async{
    try{
      final response =
          await _dio.get(ApiConstants.moviesListEndpoint, queryParameters: {
        "genre": genre,
      });
      final browseList = MoviesListModel.fromJson(response.data);
      return browseList.toBrowseEntityList;
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Failed to get Movies');
    }
  }
}