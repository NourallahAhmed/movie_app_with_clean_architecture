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

  final Credits? creditsMovies;
  final String creditsMoviesMessage;
  final RequestState creditsMoviesState;


  final SocialMedia? socialMediaMovies;
  final String socialMediaMessage;
  final RequestState socialMediaState;

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
    this.creditsMovies,
    this.creditsMoviesMessage = "",
    this.creditsMoviesState = RequestState.loading,
    this.socialMediaMovies,
    this.socialMediaMessage = "",
    this.socialMediaState = RequestState.loading,
  });

  MovieDetailsState copyWith({MovieDetails? moviesDetails,
    String? moviesDetailsMessage,
    RequestState? moviesDetailsState,
    List<MovieRecomendation>? movieRecomednations,
    String? moviesRecomendationsMessage,
    RequestState? moviesRecomendationsState,
    List<SimilarMovies>? similarMovies,
    String? similarMovieMessage,
    RequestState? similarMovieState,
    Credits ? creditMovie,
    String? creditMessage,
    RequestState? creditState,

    SocialMedia ? socialMedia,
    String? socialMediaMessage,
    RequestState? socialMediaState,

  }) {
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
        similarMovieState: similarMovieState ?? this.similarMovieState,
        creditsMovies: creditMovie ?? this.creditsMovies,
        creditsMoviesMessage: creditMessage ?? this.creditsMoviesMessage,
        creditsMoviesState: creditState ?? this.creditsMoviesState,
        socialMediaMessage: socialMediaMessage ?? this.similarMovieMessage,
        socialMediaState: socialMediaState ?? this.similarMovieState,
        socialMediaMovies: socialMedia ?? this.socialMediaMovies


    );
  }

  @override
  List<Object?> get props =>
      [
        moviesDetails,
        moviesDetailsMessage,
        moviesDetailsState,
        moviesRecomendations,
        moviesRecomendationsMessage,
        moviesRecomendationsState,
        similarMovies,
        similarMovieMessage,
        similarMovieState,
        creditsMovies,
        creditsMoviesMessage,
        creditsMoviesState,
        socialMediaMovies,
        socialMediaMessage,
        socialMediaState,
      ];
}
