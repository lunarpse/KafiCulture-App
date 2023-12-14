part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  HomeLoadedSuccessState();
}

class HomeErrorState extends HomeState {}

class HomeNavigateToOfferPageActionState extends HomeActionState {
  // JsonModel offer;

  // HomeNavigateToOfferPageActionState({required this.offer});
}

class HomeNavigateToCurationPageActionState extends HomeActionState {}

class HomeNavigateToPopularPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}
