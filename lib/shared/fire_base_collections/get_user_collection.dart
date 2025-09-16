import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_v2/shared/models/fire_base_auth/user_model.dart';

class GetUserCollection {

 static CollectionReference<UserModel> getUsersCollection() =>
      FirebaseFirestore.instance.collection('users')
          .withConverter<UserModel>(
        fromFirestore: (docSnapshot, options) => UserModel.fromJson(docSnapshot.data()!),
        toFirestore: (userModel, _) => userModel.toJson(),
      );

}