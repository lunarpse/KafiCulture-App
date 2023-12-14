part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeOffersClickedNavigateEvent extends HomeEvent {
  // JsonModel offer;
  // HomeOffersClickedNavigateEvent(this.offer);
}

class HomeCurationsNavigateEvent extends HomeEvent {}

class HomePopularsNavigateEvent extends HomeEvent {}

class HomeCartNavigateEvent extends HomeEvent {}

class HomeDrawerClickedEvent extends HomeEvent {}

class HomeLogoClickedEvent extends HomeEvent {}
