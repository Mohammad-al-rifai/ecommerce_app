part of 'login_cubit.dart';

@immutable
abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginDoneState extends LoginStates {
  final LoginModel? loginModel;

  LoginDoneState({this.loginModel});
}

class LoginErrorState extends LoginStates {}
