part of 'seemore_movies_bloc.dart';

@immutable
class SeeMoreMoviesState extends Equatable {

  final List<Movie> seemorePopularMovies;
  final String seemorePopularMessage;
  final RequestState seemorePopularState;

  final List<Movie> seemoreTopRatedMovies;
  final String seemoreTopRatedMessage;
  final RequestState seemoreTopRatedState;

  SeeMoreMoviesState({
    this.seemorePopularMovies = const [],
    this.seemorePopularMessage = "",
    this.seemorePopularState = RequestState.loading,

    this.seemoreTopRatedMovies = const [],
    this.seemoreTopRatedMessage = "",
    this.seemoreTopRatedState = RequestState.loading,
  });


  SeeMoreMoviesState copyWith({
    List<Movie>? seemorePopularMovies,
    String? seemorePopularMessage,
    RequestState? seemorePopularState,

    List<Movie>? seemoreTopRatedMovies,
    String? seemoreTopRatedMessage,
    RequestState? seemoreTopRatedState,
  }) {
    return SeeMoreMoviesState(
      seemorePopularMessage: seemorePopularMessage ??
          this.seemorePopularMessage,
      seemorePopularMovies: seemorePopularMovies ?? this.seemorePopularMovies,
      seemorePopularState: seemorePopularState ?? this.seemorePopularState,
      seemoreTopRatedMessage: seemoreTopRatedMessage ??
          this.seemoreTopRatedMessage,
      seemoreTopRatedMovies: seemoreTopRatedMovies ??
          this.seemoreTopRatedMovies,
      seemoreTopRatedState: seemoreTopRatedState ?? this.seemoreTopRatedState,
    );
  }


  @override
  List<Object> get props =>
      [
        seemorePopularMovies,
        seemorePopularMessage,
        seemorePopularState,
        seemoreTopRatedMovies,
        seemoreTopRatedMessage,
        seemoreTopRatedState,
      ];
}
