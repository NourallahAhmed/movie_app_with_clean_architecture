part of 'actor_movies_bloc.dart';

@immutable
class ActorMoviesState extends Equatable {
  final RequestState actorMoviesState;
  final String actorMoviesMessage;
  final List<Movie> actorMovies;
  final RequestState actorDetailsState;
  final String actorDetailsMessage;
  final Actor? actorDetails;

  final RequestState actorSocialMediaState;
  final String actorSocialMediaMessage;
  final SocialMedia? actorSocialMedia;

  const ActorMoviesState({
    this.actorMoviesState = RequestState.loading,
    this.actorMoviesMessage = "",
    this.actorMovies = const [],
    this.actorDetailsState = RequestState.loading,
    this.actorDetailsMessage = "",
    this.actorDetails,
    this.actorSocialMediaState = RequestState.loading,
    this.actorSocialMediaMessage = "",
    this.actorSocialMedia,
  });

  ActorMoviesState copyWith({
    String? actorMovieMessage,
    RequestState? actorState,
    List<Movie>? actorMovies,
    Actor? actorDetails,
    String? actorMessage,
    RequestState? actorDetailsState,
    SocialMedia? actorSocialMedia,
    String? actorSocialMessage,
    RequestState? actorSocialState,
  }) {
    return ActorMoviesState(
        actorMovies: actorMovies ?? this.actorMovies,
        actorMoviesMessage: actorMovieMessage ?? this.actorMoviesMessage,
        actorMoviesState: actorState ?? this.actorMoviesState,
        actorDetails: actorDetails ?? this.actorDetails,
        actorDetailsMessage: actorMessage ?? this.actorDetailsMessage,
        actorDetailsState: actorState ?? this.actorDetailsState,
        actorSocialMediaState: actorSocialState ?? this.actorSocialMediaState,
        actorSocialMediaMessage: actorSocialMessage ??
            this.actorSocialMediaMessage,
        actorSocialMedia: actorSocialMedia ?? this.actorSocialMedia);
  }

  @override
  List<Object?> get props =>
      [
        actorMoviesState,
        actorMoviesMessage,
        actorMovies,
        actorDetailsState,
        actorDetailsMessage,
        actorDetails,
        actorSocialMediaState,
        actorSocialMediaMessage,
        actorSocialMedia,
      ];
}
