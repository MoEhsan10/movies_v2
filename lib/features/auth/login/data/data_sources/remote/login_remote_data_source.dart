
import 'package:movies_v2/shared/entities/user_entity.dart';

abstract class LoginRemoteDataSource {
  Future<UserEntity> login({
    required String email,
    required String password,
  });
}
