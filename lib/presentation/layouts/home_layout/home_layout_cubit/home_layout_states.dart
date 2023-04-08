part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutStates {}

class HomeInitial extends HomeLayoutStates {}

class ChangeBottomNavState extends HomeLayoutStates {}

// Get Profile
class GetProfileLoadingState extends HomeLayoutStates {}

class GetProfileDoneState extends HomeLayoutStates {}

class GetProfileErrorState extends HomeLayoutStates {}
