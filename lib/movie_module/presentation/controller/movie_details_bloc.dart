import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_cast_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_recommendations_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_social_media.dart';
import '../../../core/utils/enums.dart';
import '../../domain/usecase/get_movie_details_usecase.dart';
import '../../domain/usecase/get_movie_similar_usecase.dart';
import '../../domain/usecase/get_movie_vedios_usecase.dart';
import 'movie_details_state.dart';

part 'movie_details_event.dart';

// part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetMovieRecomendationsUseCase getMovieRecomendationsUseCase;
  GetMovieSimilarUseCase getMovieSimilarUseCase;
  GetMovieCastUseCase getMovieCastUseCase;
  GetMovieSocialMediaUseCase getMovieSocialMediaUseCase;
  GetMovieVediosUseCase getMovieVediosUseCase;



      MovieDetailsBloc(this.getMovieDetailsUseCase,
  this.getMovieRecomendationsUseCase,
  this.getMovieSimilarUseCase,
   this.getMovieCastUseCase,
          this.getMovieSocialMediaUseCase,
          this.getMovieVediosUseCase
  ):
  super(MovieDetailsState()) {
  on<GetMovieDetailsEvent>(_getMovieDetails);
  on<GetMovieRecomendationsEvent>(_getMovieRecomendations);
  on<GetSimilarMovieEvent>(_getSimilarMovie);
  on<GetMovieCastEvent>(_getMovieCast);
  on<GetSocialMediaEvent>(_getSocialMedia);
  on<GetMovieVediosEvent>(_getMovieVedios);
  }

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event,
      Emitter<MovieDetailsState> emit) async {
    //emit make the new state to the ui

    //function call() will be called automatically
    final result = await getMovieDetailsUseCase(
        MovieDetailsParameters(event.id));

    result.fold((l) =>
        emit(state.copyWith(
            moviesDetailsMessage: l.message,
            moviesDetailsState: RequestState.error)),
            (r) =>
            emit(state.copyWith(
                moviesDetailsState: RequestState.loaded, moviesDetails: r)));
  }

  FutureOr<void> _getMovieRecomendations(GetMovieRecomendationsEvent event,
      Emitter<MovieDetailsState> emit) async {
    //function call() will be called automatically
    final result = await getMovieRecomendationsUseCase(
        MovieRecomendationParameters(event.id));

    result.fold((l) =>
        emit(state.copyWith(
            moviesRecomendationsMessage: l.message,
            moviesRecomendationsState: RequestState.error)),
            (r) =>
            emit(state.copyWith(
                moviesRecomendationsState: RequestState.loaded,
                movieRecomednations: r)));
  }

  FutureOr<void> _getSimilarMovie(GetSimilarMovieEvent event,
      Emitter<MovieDetailsState> emit) async {
    //function call() will be called automatically
    final result = await getMovieSimilarUseCase(
        MovieSimilarParameters(event.id));

    result.fold((l) =>
        emit(state.copyWith(
            similarMovieMessage: l.message,
            similarMovieState: RequestState.error)),
            (r) =>
            emit(state.copyWith(
                similarMovieState: RequestState.loaded,
                similarMovies: r)));
  }

  FutureOr<void> _getMovieCast(GetMovieCastEvent event, Emitter<MovieDetailsState> emit) async {
    //function call() will be called automatically
    final result = await getMovieCastUseCase(
        MovieDetailsParameters(event.id));




    result.fold((l) =>
        emit(state.copyWith(
            creditMessage: l.message,
            creditState: RequestState.error)),
            (r)  =>
            emit(state.copyWith(
                creditState: RequestState.loaded,
                creditMovie: r)));
  }

  FutureOr<void> _getSocialMedia(GetSocialMediaEvent event, Emitter<MovieDetailsState> emit) async {

    //function call() will be called automatically
    final result = await getMovieSocialMediaUseCase(
        MovieDetailsParameters(event.id));



    result.fold((l) =>
        emit(state.copyWith(
            socialMediaMessage: l.message,
            socialMediaState: RequestState.error)),
            (r)  =>
            emit(state.copyWith(
                socialMediaState: RequestState.loaded,
                socialMedia: r)));
  }

  FutureOr<void> _getMovieVedios(GetMovieVediosEvent event, Emitter<MovieDetailsState> emit) async  {

    //function call() will be called automatically
    final result = await getMovieVediosUseCase(
        MovieDetailsParameters(event.id));

    print("_getMovieVedios");

    print(result);

    result.fold((l) =>
        emit(state.copyWith(
            moviesVediosMessage: l.message,
            moviesVediosState: RequestState.error)),
            (r)  =>
            emit(state.copyWith(
                moviesVediosState: RequestState.loaded,
                moviesVedios: r)));

  }
}
