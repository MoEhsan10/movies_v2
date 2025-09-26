import 'package:movies_v2/shared/models/fire_base_auth/user_model.dart';

import '../../../../../shared/entities/user_entity.dart';

extension RegisterMapper on UserModel {
  UserEntity get toEntityRegister =>
      UserEntity(id: id, userName: userName, email: email,phone: phone);
}
