part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}
class getSearch extends SearchEvent{
final String Location;

  getSearch(this.Location);

}