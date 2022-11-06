import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie_module/domain/entites/credits.dart';
import 'package:movie_app/movie_module/domain/entites/movie_recomendation.dart';
import 'package:movie_app/movie_module/domain/entites/movie_similar.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_cast_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_recommendations_usecase.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entites/movie_details.dart';
import '../../domain/usecase/get_movie_details_usecase.dart';
import '../../domain/usecase/get_movie_similar_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetMovieRecomendationsUseCase getMovieRecomendationsUseCase;
  GetMovieSimilarUseCase getMovieSimilarUseCase;
  GetMovieCastUseCase getMovieCastUseCase;

      MovieDetailsBloc(this.getMovieDetailsUseCase,
  this.getMovieRecomendationsUseCase,
  this.getMovieSimilarUseCase,
          this.getMovieCastUseCase
  ):
  super(MovieDetailsState()) {
  on<GetMovieDetailsEvent>(_getMovieDetails);
  on<GetMovieRecomendationsEvent>(_getMovieRecomendations);
  on<GetSimilarMovieEvent>(_getSimilarMovie);
  on<GetMovieCastEvent>(_getMovieCast);
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
            creditsMessage: l.message,
            creditsState: RequestState.error)),
            (r) =>
            emit(state.copyWith(
                creditsState: RequestState.loaded,
                creditsMovie: r)));
  }
}
