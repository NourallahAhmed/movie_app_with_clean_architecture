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
class GetMovieCastEvent extends MovieDetailsEvent{

  final int id;

  GetMovieCastEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}
class GetSocialMediaEvent extends MovieDetailsEvent{

  final int id;

  GetSocialMediaEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}
class GetMovieVediosEvent extends MovieDetailsEvent{

  final int id;

  GetMovieVediosEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}

class GetMovieImagesEvent extends MovieDetailsEvent{

  final int id;

  GetMovieImagesEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}