part of 'seemore_movies_bloc.dart';

@immutable
abstract class SeemoreMoviesEvent extends Equatable {

  SeemoreMoviesEvent();

  @override
  List<Object> get props => [];
}

class SeeMorePopularMoviesEvents extends SeemoreMoviesEvent {
    int page;

    SeeMorePopularMoviesEvents(this.page);
}
class SeeMoreTopRatedMoviesEvents extends SeemoreMoviesEvent {
    int page;

    SeeMoreTopRatedMoviesEvents(this.page);
}