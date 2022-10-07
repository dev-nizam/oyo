import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oyo/controll/api/Hotel_Api.dart';
import 'package:oyo/controll/model/HotelModel.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelApi hotelApi=HotelApi();
 late HotelModel hotelModel;
  HotelBloc() : super(HotelInitial()) {
    on<GetHotel>((event, emit)async {
      emit(HotelLoading());
      try{
        hotelModel = await hotelApi.Hotels();
        emit(HotelLoaded());
      }catch(e){
        emit(HotelError());
        print("Error>>>>>>>>>>>>>>>>>>>>>" + e.toString());

      }
    });
  }
}
