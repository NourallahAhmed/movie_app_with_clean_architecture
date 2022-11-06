part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent{
  final int id;

  GetMovieDetailsEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}

class GetMovieRecomendationsEvent extends MovieDetailsEvent{

  final int id;

  GetMovieRecomendationsEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}

class GetSimilarMovieEvent extends MovieDetailsEvent{

  final int id;

  GetSimilarMovieEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}