part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


final class HomePageFetchEvent extends HomeEvent{}


final class RescueFormSubmitEvent extends HomeEvent{
  final String name;
  final String type;
  final String age;
  final String phone;
  final String image;
  final String description;
  RescueFormSubmitEvent({required this.name , required this.type , required this.age , required this.phone , required this.image , required this.description});
}