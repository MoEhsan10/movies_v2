import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/auth/login/data/data_sources/remote/login_remote_data_source.dart';
import 'package:movies_v2/features/auth/login/data/mappers/login_mapper.dart';
import 'package:movies_v2/shared/entities/user_entity.dart';
import 'package:movies_v2/shared/fire_base_collections/get_user_collection.dart';
import 'package:movies_v2/shared/models/fire_base_auth/user_model.dart';

@Singleton(as: LoginRemoteDataSource)
class LoginFireBaseDataSource implements LoginRemoteDataSource{

  @override
  Future<UserEntity> login({required String email, required String password}) async {
    try{
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      CollectionReference<UserModel> userCollection =
      GetUserCollection.getUsersCollection();

      DocumentSnapshot<UserModel> docSnapshot =
      await userCollection.doc(credential.user!.uid).get();

      return docSnapshot.data()!.toEntityLogin;

    } on FirebaseAuthException catch(e) {
      throw Exception('Auth error: ${e.message}');
    } on FirebaseException catch(e) {
      throw Exception('Database error: ${e.message}');
    } catch(e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

}