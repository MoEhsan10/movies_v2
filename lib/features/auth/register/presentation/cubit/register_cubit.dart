import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_v2/features/auth/register/domain/use_cases/register_use_case.dart';
import 'package:movies_v2/features/auth/register/presentation/cubit/register_states.dart';

@singleton
class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit(this._registerUseCase) : super(RegisterInitial());

  Future<void> register(
      {
      required String userName,
      required String email,
      required String phone,
      required String password,
      required String rePassword}) async {
    emit(RegisterLoading());
   try {
      await _registerUseCase.call(

          userName: userName,
          email: email,
          phone: phone,
          password: password,

          rePassword: rePassword);
      emit(RegisterSuccess());
    }catch(exception){
     emit(RegisterError(exception.toString()));
   }
  }
}
