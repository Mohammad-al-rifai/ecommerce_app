part of 'register_cubit.dart';

@immutable
abstract class RegisterStates {}

class RegisterInitial extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterDoneState extends RegisterStates {
  final RegisterModel? registerModel;

  RegisterDoneState({this.registerModel});
}

class RegisterErrorState extends RegisterStates {}

// Send Code 2 Mail States

class MailVerificationLoadingState extends RegisterStates {}

class MailVerificationDoneState extends RegisterStates {}

class MailVerificationErrorState extends RegisterStates {}

// Forget password States

class ForgetPasswordLoadingState extends RegisterStates {}

class ForgetPasswordDoneState extends RegisterStates {}

class ForgetPasswordErrorState extends RegisterStates {
  final String? err;

  ForgetPasswordErrorState({this.err});
}
