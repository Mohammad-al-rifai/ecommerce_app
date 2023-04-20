part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutStates {}

class HomeInitial extends HomeLayoutStates {}

class ChangeBottomNavState extends HomeLayoutStates {}

// Get Profile
class GetProfileLoadingState extends HomeLayoutStates {}

class GetProfileDoneState extends HomeLayoutStates {}

class GetProfileErrorState extends HomeLayoutStates {}

// Get Banners
class GetBannersLoadingState extends HomeLayoutStates {}

class GetBannersDoneState extends HomeLayoutStates {
  final List<BannerItem> banners;

  GetBannersDoneState({required this.banners});
}

class GetBannersErrorState extends HomeLayoutStates {}
