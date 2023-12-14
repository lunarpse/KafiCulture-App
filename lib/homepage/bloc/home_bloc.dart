import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_2/homepage/model/json_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeOffersClickedNavigateEvent>(homeOffersClickedNavigateEvent);
    on<HomeCurationsNavigateEvent>(homeCurationsNavigateEvent);
  }

  FutureOr<void> homeOffersClickedNavigateEvent(
      HomeOffersClickedNavigateEvent event, Emitter<HomeState> emit) {
    print("Offer Widget Clicked");
    emit(HomeNavigateToOfferPageActionState());
  }

  FutureOr<void> homeCurationsNavigateEvent(
      HomeCurationsNavigateEvent event, Emitter<HomeState> emit) {
    print("HIIIIIIIIIIIII");
    emit(HomeNavigateToCurationPageActionState());
  }
}
