import 'package:equatable/equatable.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';

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
class GetUpComingEvent extends MoviesEvents{

}

