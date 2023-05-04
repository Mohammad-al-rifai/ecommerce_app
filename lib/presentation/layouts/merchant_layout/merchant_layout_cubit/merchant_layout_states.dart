part of 'merchant_layout_cubit.dart';

@immutable
abstract class MerchantLayoutStates {}

class MerchantLayoutInitialState extends MerchantLayoutStates {}

// Get Merchant Products States:
class GetMerchantProLoadingState extends MerchantLayoutStates {}

class GetMerchantProDoneState extends MerchantLayoutStates {
  final List<MerchantProduct>? products;

  GetMerchantProDoneState({this.products});
}

class GetMerchantProErrorState extends MerchantLayoutStates {}

// Get Merchant Categories

class GetMerchantCategoriesLoadingState extends MerchantLayoutStates {}

class GetMerchantCategoriesDoneState extends MerchantLayoutStates {}

class GetMerchantCategoriesErrorState extends MerchantLayoutStates {}

// Get Product Gallery States:

class GetProductGalleryLoadingState extends MerchantLayoutStates {}

class GetProductGalleryDoneState extends MerchantLayoutStates {
  final List<String>? gallery;

  GetProductGalleryDoneState({required this.gallery});
}

class GetProductGalleryErrorState extends MerchantLayoutStates {}
