import 'package:equatable/equatable.dart';

/// events equal to the use_cases
abstract class MoviesEvents extends Equatable{

  MoviesEvents();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMovieEvent extends MoviesEvents{

}

class GetTopRatedMovieEvent extends MoviesEvents{

}

class GetPopularMovieEvent extends MoviesEvents{

}

