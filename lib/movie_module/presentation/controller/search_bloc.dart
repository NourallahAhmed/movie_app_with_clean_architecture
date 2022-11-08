import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/movie_module/domain/entites/movie.dart';
import '../../../core/utils/enums.dart';
import '../../domain/usecase/search_movie_usecase.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchMoviesUseCase searchMoviesUseCase;

  SearchBloc(
    this.searchMoviesUseCase,
  ) : super(SearchState()) {
    on<SearchMovieEvent>(searchMovie);
  }

  FutureOr<void> searchMovie(SearchMovieEvent event, Emitter<SearchState> emit) async {
    print("from searchBloc");
    final result = await searchMoviesUseCase.call(SearchParameters(event.movieName));
    print("_searchMovie");
    print(result);
    result.fold((l) => emit(
        state.copyWith(searchMoviesMessage: l.message ,searchMovieState: RequestState.error)
    ), (r) => emit(state.copyWith(searchMovies:  r , searchMovieState:  RequestState.loaded)));
  }
  }

