import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/auth/login/domain/use_cases/login_use_case.dart';
import 'package:movies_v2/features/auth/login/presentation/cubit/login_states.dart';
import 'package:movies_v2/shared/shared_preferences/user_preferences.dart';

@singleton
class LoginCubit extends Cubit<LoginStates> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    final result = await _loginUseCase.call(email: email, password: password);

    result.fold(
          (failure) => emit(LoginError(failure.message)),
          (userEntity) async {
        // Save user data to SharedPreferences
        await UserPreferences.saveUserData(
          userId: userEntity.id,
          name: userEntity.userName,
          phone: userEntity.phone,
          email: userEntity.email,
        );
        emit(LoginSuccess());
      },
    );
  }
}