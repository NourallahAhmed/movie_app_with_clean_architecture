part of 'search_bloc.dart';

@immutable

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchMovieEvent extends SearchEvent {
  final movieName;

  SearchMovieEvent(this.movieName);

  @override
  List<Object> get props => [movieName];
}
