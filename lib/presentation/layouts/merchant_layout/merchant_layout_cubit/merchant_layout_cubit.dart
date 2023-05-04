import 'package:bloc/bloc.dart';
import 'package:ecommerce/config/urls.dart';
import 'package:ecommerce/data/network/remote/dio_helper.dart';
import 'package:ecommerce/domain/models/product_models/product_galery_model.dart';
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
  List<MerchantProduct> products = [];

  getMerchantProducts({
    required String merchantId,
  }) {
    emit(GetMerchantProLoadingState());
    if (products.isNotEmpty) {
      emit(GetMerchantProDoneState(products: products));
    } else {
      DioHelper.getData(
        url: Urls.getMerchantProducts + merchantId,
      ).then((value) {
        merchantProductsModel = MerchantProductsModel.fromJson(value.data);
        if (merchantProductsModel?.data?.products != null) {
          if (merchantProductsModel!.data!.products.isNotEmpty) {
            products = merchantProductsModel!.data!.products;
            emit(GetMerchantProDoneState(products: products));
          }
        }
      }).catchError((err) {
        print(err.toString());
        emit(GetMerchantProErrorState());
      });
    }
  }





  // get product Gallery:

  ProductGalleryModel productGalleryModel = ProductGalleryModel();
  List<String>? gallery = [];

  getProductGallery({
    required String proId,
  }) {
    emit(GetProductGalleryLoadingState());
    DioHelper.getData(
      url: Urls.getGalleryProduct + proId,
    ).then((value) {
      productGalleryModel = ProductGalleryModel.fromJson(value.data);
      if (value.data['status']) {
        if (productGalleryModel.data != null &&
            productGalleryModel.data?.gallery != null &&
            productGalleryModel.data?.gallery?.gallery != null) {
          if (productGalleryModel.data!.gallery!.gallery!.isNotEmpty) {
            print('GetProduct Gallery Done');
            emit(
              GetProductGalleryDoneState(
                gallery: productGalleryModel.data?.gallery?.gallery,
              ),
            );
          }
        }
      }
    }).catchError((err) {
      print(err.toString());
      emit(GetProductGalleryErrorState());
    });
  }
}
