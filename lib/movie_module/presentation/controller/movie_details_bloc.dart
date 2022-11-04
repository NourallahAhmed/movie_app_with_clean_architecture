import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie_module/domain/entites/movie_recomendation.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_recommendations_usecase.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entites/movie_details.dart';
import '../../domain/usecase/get_movie_details_usecase.dart';
import 'movie_bloc_state.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetMovieRecomendationsUseCase getMovieRecomendationsUseCase;


  MovieDetailsBloc(this.getMovieDetailsUseCase ,
      this.getMovieRecomendationsUseCase) : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecomendationsEvent>(_getMovieRecomendations);
  }

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event,
      Emitter<MovieDetailsState> emit) async {
    //emit make the new state to the ui

    //function call() will be called automatically
    final result = await getMovieDetailsUseCase(
        MovieDetailsParameters(event.id));

    result.fold((l) => emit(state.copyWith(
            moviesDetailsMessage: l.message,
            moviesDetailsState: RequestState.error)),
        (r) => emit(state.copyWith(
            moviesDetailsState: RequestState.loaded, moviesDetails: r)));

  }

  FutureOr<void> _getMovieRecomendations(GetMovieRecomendationsEvent event, Emitter<MovieDetailsState> emit) async {


    //function call() will be called automatically
    final result = await getMovieRecomendationsUseCase(
        MovieRecomendationParameters(event.id));

    result.fold((l) => emit(state.copyWith(
        moviesRecomendationsMessage: l.message,
        moviesRecomendationsState: RequestState.error)),
            (r) => emit(state.copyWith(
            moviesRecomendationsState: RequestState.loaded, movieRecomednations: r)));

  }
}
