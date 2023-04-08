import 'package:bloc/bloc.dart';
import 'package:ecommerce/config/urls.dart';
import 'package:ecommerce/domain/requests/register_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/network/remote/dio_helper.dart';
import '../../../../domain/models/auth_models/mail_verifaication_model.dart';
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
      if (value.data['status'] == 'success') {
        registerModel = RegisterModel.fromJson(value.data);
        print('Register Token Is : ${registerModel?.data?.token}');
        emit(RegisterDoneState(registerModel: registerModel));
      }
    }).catchError((error) {
      emit(RegisterErrorState());
    });
  }

  // =================================================
  MailVerificationModel? mailVerificationModel;

  sendCode2mail({
    required String email,
  }) {
    emit(MailVerificationLoadingState());
    DioHelper.postData(
      url: Urls.mailVerify,
      data: {"email": email},
    ).then((value) {
      mailVerificationModel = MailVerificationModel.fromJson(value.data);
      emit(MailVerificationDoneState(
          mailVerificationModel: mailVerificationModel));
    }).catchError((error) {
      emit(MailVerificationErrorState());
    });
  }
}
