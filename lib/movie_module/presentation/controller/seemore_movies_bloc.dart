import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/movie_module/domain/usecase/get_seemore_popular_usecase.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entites/movie.dart';
import '../../domain/usecase/get_seemore_toprated_usecase.dart';

part 'seemore_movies_event.dart';
part 'seemore_movies_state.dart';

class SeemoreMoviesBloc extends Bloc<SeemoreMoviesEvent, SeeMoreMoviesState> {

  GetSeeMorePopularMoviesUseCase getSeeMorePopularMoviesUseCase;
  GetSeeMoreTopRatedMoviesUseCase getSeeMoreTopRatedMoviesUseCase;
  SeemoreMoviesBloc(this.getSeeMorePopularMoviesUseCase , this.getSeeMoreTopRatedMoviesUseCase) : super(SeeMoreMoviesState()) {
    on<SeeMorePopularMoviesEvents>(_seeMorePopular);
    on<SeeMoreTopRatedMoviesEvents>(_seeMoreTopRated);
  }



  FutureOr<void> _seeMorePopular(SeeMorePopularMoviesEvents event, Emitter<SeeMoreMoviesState> emit) async {

    final result = await getSeeMorePopularMoviesUseCase( MovieParameters(event.page));

    print("_seeMorePopular");

    print(result);

    result.fold(
        (l) => emit(state.copyWith(
            seemorePopularMessage : l.message,
            seemorePopularState: RequestState.error)),
        (r) => emit(state.copyWith(
            seemorePopularState: RequestState.loaded, seemorePopularMovies: r)));
  }

  FutureOr<void> _seeMoreTopRated(SeeMoreTopRatedMoviesEvents event, Emitter<SeeMoreMoviesState> emit) async {

    final result = await getSeeMoreTopRatedMoviesUseCase( MovieParameters(event.page));

    print("_seeMoreTopRated");

    print(result);

    result.fold(
            (l) => emit(state.copyWith(
            seemoreTopRatedMessage : l.message,
            seemoreTopRatedState: RequestState.error)),
            (r) => emit(state.copyWith(
            seemoreTopRatedState: RequestState.loaded, seemoreTopRatedMovies: r)));
  }
}
