part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutStates {}

class HomeInitial extends HomeLayoutStates {}

class ChangeBottomNavState extends HomeLayoutStates {
  final int index;

  ChangeBottomNavState({required this.index});
}

// Get Profile
class GetProfileLoadingState extends HomeLayoutStates {}

class GetProfileDoneState extends HomeLayoutStates {}

class GetProfileLocallyDoneState extends HomeLayoutStates {
  final String? fullName;
  final String? email;

  GetProfileLocallyDoneState({
    this.fullName,
    this.email,
  });
}

class GetProfileErrorState extends HomeLayoutStates {}

// Get Banners
class GetBannersLoadingState extends HomeLayoutStates {}

class GetBannersDoneState extends HomeLayoutStates {
  final List<BannerItem> banners;

  GetBannersDoneState({required this.banners});
}

class GetBannersErrorState extends HomeLayoutStates {}

// Logout States

class LogoutLoadingState extends HomeLayoutStates {}

class LogoutDoneState extends HomeLayoutStates {
  final String message;

  LogoutDoneState({required this.message});
}

class LogoutErrorState extends HomeLayoutStates {}

// Hot Selling States
class GetHotSellingLoadingState extends HomeLayoutStates {}

class GetHotSellingDoneState extends HomeLayoutStates {
  final List<HotSellingProduct>? products;

  GetHotSellingDoneState({this.products});
}

class GetHotSellingErrorState extends HomeLayoutStates {
  final String? error;

  GetHotSellingErrorState({this.error});
}

// Get Categories States
class GetCategoriesLoadingState extends HomeLayoutStates {}

class GetCategoriesDoneState extends HomeLayoutStates {
  final List<CategoryData>? categories;

  GetCategoriesDoneState({this.categories});
}

class GetCategoriesErrorState extends HomeLayoutStates {
  final String? error;

  GetCategoriesErrorState({this.error});
}

// Get All Merchants States:

class GetMerchantsLoadingState extends HomeLayoutStates {}

class GetMerchantsDoneState extends HomeLayoutStates {
  final List<MerchantUser>? merchants;

  GetMerchantsDoneState({this.merchants});
}

class GetMerchantsErrorState extends HomeLayoutStates {}
