import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/search/data/data_sourcess/remote/search_remote_data_source.dart';
import 'package:movies_v2/features/main_layout/search/data/mappers/search_mapper.dart';
import 'package:movies_v2/features/main_layout/search/domain/entities/search_entity.dart';
import 'package:movies_v2/shared/error/exceptions.dart';
import 'package:movies_v2/shared/models/MoviesListModel.dart';
import 'package:movies_v2/shared/resources/app_constants.dart';

@Singleton(as: SearchRemoteDataSource)
class SearchApiRemoteDataSource implements SearchRemoteDataSource {
  final Dio _dio;

  SearchApiRemoteDataSource(this._dio);

  @override
  Future<List<SearchEntity>> getMoviesBySearch(String query) async {
    try {
      final response = await _dio.get(ApiConstants.moviesListEndpoint, queryParameters: {
        "query_term": query,
        "limit": "50",
      });

      final searchList = MoviesListModel.fromJson(response.data);
      return searchList.toSearchEntityList;
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Failed to get Movies');
    }
  }
}