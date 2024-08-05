part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomePageFetchState extends HomeState{
  final List data;
  HomePageFetchState(this.data);
}

final class HomePageLoadingState extends HomeState{}

final class HomePageErrorState extends HomeState{
  final String message;
  HomePageErrorState(this.message);
}

final class RescueFormSubmitSuccessState extends HomeState{
  final String message;
  RescueFormSubmitSuccessState({required this.message});
}


final class RescueFormSubmitFailureState extends HomeState{
  final String errorMessage;
  RescueFormSubmitFailureState({required this.errorMessage});
}


final class RescueFormLodingState extends HomeState{}
