import 'package:equatable/equatable.dart';
import 'package:movie_app/movie_module/domain/entites/images.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entites/credits.dart';
import '../../domain/entites/movie_details.dart';
import '../../domain/entites/movie_recomendation.dart';
import '../../domain/entites/movie_similar.dart';

import '../../domain/entites/movie_vedios.dart';
import '../../domain/entites/social_media.dart';

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


  final List<Movie_Vedios> movieVedios;
  final String movieVediosMessage;
  final RequestState movieVediosState;
  final List<MovieImages>? moviesImages;
  final String? moviesImagesMessage;
  final RequestState moviesImagesState;

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
    this.movieVedios = const [],
    this.movieVediosMessage = "",
    this.movieVediosState = RequestState.loading,


    this.moviesImages = const [],
    this.moviesImagesMessage = "",
    this.moviesImagesState = RequestState.loading,
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


    List<Movie_Vedios>? moviesVedios,
    String? moviesVediosMessage,
    RequestState? moviesVediosState,

    List<MovieImages>? moviesImages,
    String? moviesImagesMessage,
    RequestState? moviesImagesState,

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
      socialMediaMovies: socialMedia ?? this.socialMediaMovies,
      movieVedios: moviesVedios ?? this.movieVedios,
      movieVediosMessage: moviesVediosMessage ?? this.movieVediosMessage,
      movieVediosState: moviesVediosState ?? this.movieVediosState,
      moviesImages: moviesImages ?? this.moviesImages,
      moviesImagesMessage:  moviesImagesMessage ?? this.moviesImagesMessage,
      moviesImagesState:  moviesImagesState ?? this. moviesImagesState,

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
        movieVedios,
        movieVediosMessage,
        movieVediosState,
        moviesImages,
        moviesImagesMessage,
        moviesImagesState,
      ];
}
