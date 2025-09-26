import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/main_layout/movie_details/data/data_sources/remote/movie_details_remote_data_source.dart';
import 'package:movies_v2/features/main_layout/movie_details/data/mappers/movie_details_mapper.dart';
import 'package:movies_v2/features/main_layout/movie_details/data/model/movie_details_model.dart';
import 'package:movies_v2/features/main_layout/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_v2/shared/error/exceptions.dart';

@Singleton(as: MovieDetailsRemoteDataSource)
class MovieDetailsFireBaseDataSource implements MovieDetailsRemoteDataSource {
  static const String _watchlistCollection = 'watchlist';

  static CollectionReference<MovieDetailsModel> getWatchlistCollection(String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection(_watchlistCollection)
        .withConverter<MovieDetailsModel>(
      fromFirestore: (snapshot, _) => MovieDetailsModel.fromJson(snapshot.data()!),
      toFirestore: (movie, _) => movie.toJson(),
    );
  }

  @override
  Future<void> addMovieToWatchList(MovieDetailsEntity movie, String userId) async {
    try {
      CollectionReference<MovieDetailsModel> watchlistCollection = getWatchlistCollection(userId);
      DocumentReference<MovieDetailsModel> doc = watchlistCollection.doc(movie.id.toString());

      final movieModel = movie.toMovieDetailsModel().copyWith(
        addedToWatchlistAt: DateTime.now(),
      );

      await doc.set(movieModel);
      print('📱 Movie added to Firebase successfully');
    } catch (e) {
      print('❌ Firebase error: $e');
      throw RemoteException(message: e.toString());
    }
  }
}