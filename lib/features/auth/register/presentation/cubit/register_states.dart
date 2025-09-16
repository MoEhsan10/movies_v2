abstract class RegisterStates {}


class RegisterInitial extends RegisterStates{}


class RegisterLoading extends RegisterStates{}
class RegisterError extends RegisterStates{
  final String message;

  RegisterError(this.message);
}
class RegisterSuccess extends RegisterStates{}