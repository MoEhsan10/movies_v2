import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/auth/register/data/data_sources/remote/register_remote_data_source.dart';
import 'package:movies_v2/features/auth/register/data/mappers/register_mapper.dart';
import 'package:movies_v2/shared/entities/user_entity.dart';
import 'package:movies_v2/shared/fire_base_collections/get_user_collection.dart';
import 'package:movies_v2/shared/models/fire_base_auth/user_model.dart';

@Singleton(as:RegisterRemoteDataSource)
class RegisterFireBaseDataSource implements RegisterRemoteDataSource {
  @override
  Future<UserEntity> register(
      {
      required String userName,
      required String email,
      required String password,
      required String rePassword}) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    UserModel user = UserModel(
        id: credential.user!.uid,
        userName: userName,
        email: email);
    CollectionReference<UserModel> userCollection = GetUserCollection.getUsersCollection();
    userCollection.doc(user.id).set(user);
    return user.toEntityRegister;

  }

}
