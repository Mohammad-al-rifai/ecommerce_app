import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/config/urls.dart';
import 'package:ecommerce/data/network/remote/dio_helper.dart';
import 'package:ecommerce/domain/models/home_models/banner_model.dart';
import 'package:ecommerce/presentation/screens/cart/cart_screen.dart';
import 'package:ecommerce/presentation/screens/home/home_screen.dart';
import 'package:ecommerce/presentation/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

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

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  // Get Profile

  getProfile() {}

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
}
