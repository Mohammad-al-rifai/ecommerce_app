import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/config/urls.dart';
import 'package:ecommerce/domain/requests/forget_password_request.dart';
import 'package:ecommerce/domain/requests/register_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/network/remote/dio_helper.dart';
import '../../../../domain/models/auth_models/register_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  RegisterModel? registerModel;

  register({
    required RegisterRequest registerRequest,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: Urls.register,
      data: registerRequest.toJson(),
    ).then((value) {
      if (value.data['status']) {
        registerModel = RegisterModel.fromJson(value.data);
        emit(RegisterDoneState(registerModel: registerModel));
      }
    }).catchError((error) {
      emit(RegisterErrorState());
    });
  }

  // =================================================
  sendCode2mail({
    required String email,
  }) {
    emit(MailVerificationLoadingState());
    DioHelper.postData(
      url: Urls.mailVerify,
      data: {"email": email},
    ).then((value) {
      if (value.data['status']) {
        emit(MailVerificationDoneState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(MailVerificationErrorState());
    });
  }

  // ====================== Forget Password ========================

  forgetPassword({
    required ForgetPasswordRequest forgetPasswordRequest,
  }) {
    emit(ForgetPasswordLoadingState());

    DioHelper.putData(
      url: Urls.forgetPassword,
      data: forgetPasswordRequest.toJson(),
    ).then((value) {
      if (value.data['status']) {
        emit(ForgetPasswordDoneState());
      }
    }).catchError((err) {
      emit(ForgetPasswordErrorState(err: err));
    });
  }
}
