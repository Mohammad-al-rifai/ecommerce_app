part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutStates {}

class HomeInitial extends HomeLayoutStates {}

class ChangeBottomNavState extends HomeLayoutStates {}

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
