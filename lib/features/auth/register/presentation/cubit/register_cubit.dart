import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/auth/register/domain/use_cases/register_use_case.dart';
import 'package:movies_v2/features/auth/register/presentation/cubit/register_states.dart';
import 'package:movies_v2/shared/shared_preferences/user_preferences.dart';

@singleton
class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit(this._registerUseCase) : super(RegisterInitial());

  Future<void> register({
    required String userName,
    required String email,
    required String phone,
    required String password,
    required String rePassword,
  }) async {
    emit(RegisterLoading());

    final result = await _registerUseCase.call(
      userName: userName,
      email: email,
      phone: phone,
      password: password,
      rePassword: rePassword,
    );

    result.fold(
          (failure) => emit(RegisterError(failure.message)),
          (userEntity) async {
        // Save user data to SharedPreferences
        await UserPreferences.saveUserData(
          userId: userEntity.id,
          name: userEntity.userName,
          phone: userEntity.phone,
          email: userEntity.email,
        );
        emit(RegisterSuccess());
      },
    );
  }
}