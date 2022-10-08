part of 'hotel_bloc.dart';

@immutable
abstract class HotelEvent {}
class GetHotel extends HotelEvent{
  final String id;
final String indate;
final String outdate;

  GetHotel(this.id, this.indate, this.outdate);


}