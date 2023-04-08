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

class MailVerificationDoneState extends RegisterStates {
  final MailVerificationModel? mailVerificationModel;

  MailVerificationDoneState({this.mailVerificationModel});
}

class MailVerificationErrorState extends RegisterStates {}
