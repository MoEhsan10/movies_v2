
import '../../../../../../shared/entities/user_entity.dart';

abstract class RegisterRemoteDataSource {

  Future<UserEntity> register({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String rePassword,
  });
}