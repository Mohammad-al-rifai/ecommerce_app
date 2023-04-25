import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/config/urls.dart';
import 'package:ecommerce/data/network/local/cache_helper.dart';
import 'package:ecommerce/data/network/remote/dio_helper.dart';
import 'package:ecommerce/domain/models/auth_models/user_profile.dart';
import 'package:ecommerce/domain/models/home_models/banner_model.dart';
import 'package:ecommerce/presentation/components/toast_notifications.dart';
import 'package:ecommerce/presentation/resources/constants_manager.dart';
import 'package:ecommerce/presentation/screens/cart/cart_screen.dart';
import 'package:ecommerce/presentation/screens/home/home_screen.dart';
import 'package:ecommerce/presentation/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/network/local/keys.dart';
import '../../../screens/categories/categories_screen.dart';

part 'home_layout_states.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  List<String> titles = [
    'home'.tr(),
    'categories'.tr(),
    'cart'.tr(),
    'profile'.tr(),
  ];

  void changeBottom(int index, {Function? function}) {
    if (function != null) {
      function(index);
    }
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  // Get Profile

  UserProfileModel userProfileModel = UserProfileModel();

  getProfile() {
    emit(GetProfileLoadingState());
    DioHelper.getData(
      url: Urls.getProfile,
      token: Constants.bearer + Constants.token,
    ).then((value) {
      userProfileModel = UserProfileModel.fromJson(value.data);
      if (value.data['status']) {
        CacheHelper.saveData(
          key: CacheHelperKeys.fullName,
          value: userProfileModel.data?.user?.fullName,
        );
        CacheHelper.saveData(
          key: CacheHelperKeys.email,
          value: userProfileModel.data?.user?.email,
        );
      }
      emit(GetProfileDoneState());
    }).catchError((err) {
      print(err.toString());
      emit(GetProfileErrorState());
    });
  }

  // Get Banners

  BannersModel bannersModel = BannersModel();

  getBanners() {
    emit(GetBannersLoadingState());

    DioHelper.getData(url: Urls.banners).then((value) {
      if (value.data['status']) {
        bannersModel = BannersModel.fromJson(value.data);
        emit(GetBannersDoneState(banners: bannersModel.data!.banners!));
      }
    }).catchError((err) {
      print(err.toString());
      emit(GetBannersErrorState());
    });
  }

  logout() {
    emit(LogoutLoadingState());
    DioHelper.getData(
      url: Urls.logout,
      token: Constants.bearer + Constants.token,
    ).then((value) {
      if (value.data['status']) {
        emit(LogoutDoneState(message: value.data['message']));
      } else if (value.data['error'] == "The provided token is invalid") {
        showToast(text: value.data['error'], state: ToastStates.ERROR);
      }
    }).catchError((err) {
      print(err.toString());
      emit(LogoutErrorState());
    });
  }
}
