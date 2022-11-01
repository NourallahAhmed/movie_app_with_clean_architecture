import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie_module/domain/usecase/get_now_playing_movie_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_bloc_event.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_bloc_state.dart';

import '../../domain/usecase/get_popular_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    //add events using On

    on<GetNowPlayingMovieEvent>((event, emit) async {
      //emit make the new state to the ui

      final result = await getNowPlayingMoviesUseCase.getNowPlayingMovies();

      result.fold(
        (l) => emit(
            state.copyWith(
                nowPlayingState: RequestState.error, nowPlayingMessage: l.message
            )
        ),
        (r) => emit(state.copyWith(
            nowPlayingState: RequestState.loaded, nowPlayingMovies: r)),
      );
    });


    //popular
    on<GetPopularMovieEvent>((event, emit) async {
      //emit make the new state to the ui
      final result = await getPopularMoviesUseCase.getPopularMovies();
      result.fold(
        (l) => emit(
            state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
        (r) => emit(state.copyWith(
            popularState: RequestState.loaded, popularMovies: r)),
      );
    });


    //topRated
    on<GetTopRatedMovieEvent>((event, emit) async {
      //emit make the new state to the ui
      final result = await getTopRatedMoviesUseCase.getTopRateMovies();
      result.fold(
        (l) => emit(state.copyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedState: RequestState.loaded, topRatedMovies: r)),
      );
    });
  }
}
