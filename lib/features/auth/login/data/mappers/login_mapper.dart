import 'package:movies_v2/shared/models/fire_base_auth/user_model.dart';

import '../../../../../shared/entities/user_entity.dart';

extension LoginMapper on UserModel {
  UserEntity get toEntityLogin =>
      UserEntity(id: id,userName: userName, email: email);
}
