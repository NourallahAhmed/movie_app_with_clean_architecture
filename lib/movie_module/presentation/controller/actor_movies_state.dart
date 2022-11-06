part of 'actor_movies_bloc.dart';

@immutable
class ActorMoviesState extends Equatable {
  final RequestState actorMoviesState;
  final String actorMoviesMessage;
  final List<Movie> actorMovies;

  const ActorMoviesState({
    this.actorMoviesState = RequestState.loading,
    this.actorMoviesMessage = "",
    this.actorMovies = const [],
  });


  ActorMoviesState copyWith ({
    String? actorMovieMessage,
    RequestState? actorState,
    List<Movie>? actorMovies,
  }){
  print("actorMovieState ${actorState}");
    return ActorMoviesState(
      actorMovies:  actorMovies ?? this.actorMovies,
      actorMoviesMessage:  actorMovieMessage ?? this.actorMoviesMessage,
      actorMoviesState: actorState ?? this.actorMoviesState
    );
   }



  @override
  List<Object?> get props => [
        actorMovies,
        actorMoviesMessage,
        actorMoviesState,
      ];
}
