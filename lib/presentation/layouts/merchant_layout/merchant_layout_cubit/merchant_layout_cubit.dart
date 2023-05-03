import 'package:bloc/bloc.dart';
import 'package:ecommerce/config/urls.dart';
import 'package:ecommerce/data/network/remote/dio_helper.dart';
import 'package:ecommerce/presentation/components/button.dart';
import 'package:ecommerce/presentation/resources/string_manager.dart';
import 'package:ecommerce/presentation/screens/merchant/categories/categories_screen.dart';
import 'package:ecommerce/presentation/screens/merchant/offers/offers_screen.dart';
import 'package:ecommerce/presentation/screens/merchant/products/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/models/product_models/merchant_products_model.dart';

part 'merchant_layout_states.dart';

class MerchantLayoutCubit extends Cubit<MerchantLayoutStates> {
  MerchantLayoutCubit() : super(MerchantLayoutInitialState());

  static MerchantLayoutCubit get(context) => BlocProvider.of(context);

  // 1- Get Merchant Products:
  MerchantProductsModel? merchantProductsModel = MerchantProductsModel();
  List<MerchantProduct>? products = [];

  getMerchantProducts({
    required String merchantId,
  }) {
    emit(GetMerchantProLoadingState());
    DioHelper.getData(
      url: Urls.getMerchantProducts + merchantId,
    ).then((value) {
      merchantProductsModel = MerchantProductsModel.fromJson(value.data);
      if (merchantProductsModel?.data?.products != null) {
        products = merchantProductsModel?.data?.products;
      }
      emit(GetMerchantProDoneState(products: products));
    }).catchError((err) {
      print(err.toString());
      emit(GetMerchantProErrorState());
    });
  }
}
