import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie_module/domain/entites/movie.dart';
import 'package:movie_app/movie_module/domain/entites/social_media.dart';

import '../../domain/entites/actor.dart';
import '../../domain/usecase/get_actor_details_usecase.dart';
import '../../domain/usecase/get_actor_movies_usecase.dart';
import '../../domain/usecase/get_person_social_media.dart';

part 'actor_movies_event.dart';

part 'actor_movies_state.dart';

class ActorMoviesBloc extends Bloc<ActorEvents, ActorMoviesState> {
  GetActorMoviesUseCase getActorMoviesUseCase;
  GetActorDetailsUseCase getActorDetailsUseCase;
  GetPersonSocialMediaUseCase getPersonSocialMediaUseCase;
  ActorMoviesBloc(
    this.getActorMoviesUseCase,
      this.getActorDetailsUseCase,
      this.getPersonSocialMediaUseCase
  ) : super( ActorMoviesState()) {
    on<ActorMoviesEvent>(_getActorMovies);
    on<ActorDetailsEvent> (_getActorDetails);
    on<ActorSocialMediaEvent> (_getActorSocialMedia);
  }

  FutureOr<void> _getActorMovies(
      ActorMoviesEvent event, Emitter<ActorMoviesState> emit) async {
      final result = await getActorMoviesUseCase.call(ActorDetailsParameters(event.id));
      print("_getActorMovies");
      print(result);
      result.fold((l) => emit(
        state.copyWith(actorMovieMessage: l.message, actorState: RequestState.error)
      ), (r) => emit(state.copyWith(actorMovies:  r , actorState:  RequestState.loaded)));

  }

  FutureOr<void> _getActorDetails(ActorDetailsEvent event, Emitter<ActorMoviesState> emit) async {
    final result = await getActorDetailsUseCase.call(ActorDetailsParameters(event.id));
    print("_getActorDetails");
    print(result);
    result.fold((l) => emit(
        state.copyWith(actorMessage: l.message, actorDetailsState: RequestState.error)
    ), (r) => emit(state.copyWith(actorDetails:  r , actorDetailsState:  RequestState.loaded)));
  }

  FutureOr<void> _getActorSocialMedia(ActorSocialMediaEvent event, Emitter<ActorMoviesState> emit) async {
    final result = await getPersonSocialMediaUseCase.call(ActorDetailsParameters(event.id));
    print("_getActorSocialMedia");
    print(result);
    result.fold((l) => emit(
        state.copyWith(actorSocialMessage: l.message, actorSocialState: RequestState.error)
    ), (r) {
      emit(state.copyWith(actorSocialMedia:  r , actorSocialState:  RequestState.loaded));
      print("Actor Socail media result");
      print(r);
    } );
  }
}
