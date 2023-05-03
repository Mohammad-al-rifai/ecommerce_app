import 'package:ecommerce/config/urls.dart';
import 'package:ecommerce/domain/models/auth_models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/network/remote/dio_helper.dart';
import '../../../layouts/home_layout/home_layout_cubit/home_layout_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;

  login({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: Urls.login,
      data: {
        'nameOrEmail': email,
        'password': password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginDoneState(loginModel: loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }
}
