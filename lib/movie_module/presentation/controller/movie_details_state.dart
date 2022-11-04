part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  //todo details

  final MovieDetails? moviesDetails;
  final String moviesDetailsMessage;
  final RequestState moviesDetailsState;

  final List<MovieRecomendation> moviesRecomendations;
  final String moviesRecomendationsMessage;
  final RequestState moviesRecomendationsState;

  MovieDetailsState({this.moviesDetails ,
    this.moviesDetailsMessage = "",
    this.moviesDetailsState = RequestState.loading,
    this.moviesRecomendations = const [],
    this.moviesRecomendationsMessage = "",
    this.moviesRecomendationsState = RequestState.loading,
  }
  );



  MovieDetailsState copyWith({
     MovieDetails? moviesDetails,
     String? moviesDetailsMessage,
     RequestState? moviesDetailsState,
     List<MovieRecomendation>? movieRecomednations,
     String? moviesRecomendationsMessage,
    RequestState? moviesRecomendationsState

  }) {
    return MovieDetailsState(
        moviesDetails: moviesDetails ?? this.moviesDetails,
        moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
        moviesDetailsState : moviesDetailsState ?? this.moviesDetailsState,
        moviesRecomendations:  movieRecomednations ?? this.moviesRecomendations,
        moviesRecomendationsMessage:  moviesRecomendationsMessage ?? this.moviesRecomendationsMessage,
        moviesRecomendationsState: moviesRecomendationsState ?? this.moviesRecomendationsState,
    );
  }
  @override
  List<Object?> get props => [
        moviesDetails,
        moviesDetailsMessage,
        moviesDetailsState,
        moviesRecomendationsState,
        moviesRecomendationsMessage,
        moviesRecomendations
      ];
}
