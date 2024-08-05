import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:petapp/constants.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomePageFetchEvent>((event, emit) async {
      emit(HomePageLoadingState());
        final jsonResponse = await http.get(Uri.parse(getpets), headers: {"Content-Type": "application/json"});
        final response = jsonDecode(jsonResponse.body);
          if (jsonResponse.statusCode <= 400) {
            emit(HomePageFetchState(response['data']));
          }else{
            emit(HomePageErrorState(response['message']));
          } 
    });
    on<RescueFormSubmitEvent>((event , emit) async {
      emit(RescueFormLodingState());
      try {
        final parms = {
        'name': event.name,
        'type': event.type,
        'age':event.age,
        'phone':event.phone,
        'image':event.image,
        'description':event.description,
      };
      final jsonResponse = await http.post(Uri.parse(addPets) ,headers: {"Content-Type": "application/json"}, body: jsonEncode(parms));
      final response = jsonDecode(jsonResponse.body);
      if(jsonResponse.statusCode <= 400){
        emit(RescueFormSubmitSuccessState(message: response['message']));
      }else{
        emit(RescueFormSubmitFailureState(errorMessage: response['message']));
      }
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
