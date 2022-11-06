part of 'actor_movies_bloc.dart';

@immutable
class ActorMoviesState extends Equatable {
  final RequestState actorMoviesState;
  final String actorMoviesMessage;
  final List<Movie> actorMovies;
  final RequestState actorDetailsState;
  final String actorDetailsMessage;
  final Actor? actorDetails;

  const ActorMoviesState({
    this.actorMoviesState = RequestState.loading,
    this.actorMoviesMessage = "",
    this.actorMovies = const [],
    this.actorDetailsState = RequestState.loading,
    this.actorDetailsMessage = "",
    this.actorDetails,
  });

  ActorMoviesState copyWith({
    String? actorMovieMessage,
    RequestState? actorState,
    List<Movie>? actorMovies,
    Actor? actorDetails,
    String? actorMessage,
    RequestState? actorDetailsState,
  }) {
    return ActorMoviesState(
        actorMovies: actorMovies ?? this.actorMovies,
        actorMoviesMessage: actorMovieMessage ?? this.actorMoviesMessage,
        actorMoviesState: actorState ?? this.actorMoviesState,
        actorDetails: actorDetails ?? this.actorDetails,
        actorDetailsMessage: actorMessage ?? this.actorDetailsMessage,
        actorDetailsState: actorState ?? this.actorDetailsState);
  }

  @override
  List<Object?> get props => [
        actorMovies,
        actorMoviesMessage,
        actorMoviesState,
        actorDetailsState,
        actorDetails,
        actorDetailsMessage
      ];
}
