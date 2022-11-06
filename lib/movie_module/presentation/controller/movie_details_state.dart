part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  //todo details

  final MovieDetails? moviesDetails;
  final String moviesDetailsMessage;
  final RequestState moviesDetailsState;

  final List<MovieRecomendation> moviesRecomendations;
  final String moviesRecomendationsMessage;
  final RequestState moviesRecomendationsState;

  final List<SimilarMovies> similarMovies;
  final String similarMovieMessage;
  final RequestState similarMovieState;

  MovieDetailsState({
    this.moviesDetails,
    this.moviesDetailsMessage = "",
    this.moviesDetailsState = RequestState.loading,
    this.moviesRecomendations = const [],
    this.moviesRecomendationsMessage = "",
    this.moviesRecomendationsState = RequestState.loading,
    this.similarMovies = const [],
    this.similarMovieMessage = "",
    this.similarMovieState = RequestState.loading,
  });

  MovieDetailsState copyWith(
      {MovieDetails? moviesDetails,
      String? moviesDetailsMessage,
      RequestState? moviesDetailsState,
      List<MovieRecomendation>? movieRecomednations,
      String? moviesRecomendationsMessage,
      RequestState? moviesRecomendationsState,
      List<SimilarMovies>? similarMovies,
      String? similarMovieMessage,
      RequestState? similarMovieState}) {
    return MovieDetailsState(
        moviesDetails: moviesDetails ?? this.moviesDetails,
        moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
        moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
        moviesRecomendations: movieRecomednations ?? this.moviesRecomendations,
        moviesRecomendationsMessage:
            moviesRecomendationsMessage ?? this.moviesRecomendationsMessage,
        moviesRecomendationsState:
            moviesRecomendationsState ?? this.moviesRecomendationsState,
        similarMovieMessage: similarMovieMessage ?? this.similarMovieMessage,
        similarMovies: similarMovies ?? this.similarMovies,
        similarMovieState: similarMovieState ?? this.similarMovieState);
  }

  @override
  List<Object?> get props => [
        moviesDetails,
        moviesDetailsMessage,
        moviesDetailsState,
        moviesRecomendationsState,
        moviesRecomendationsMessage,
        moviesRecomendations,
        similarMovieState,
        similarMovies,
        similarMovieMessage
      ];
}
