part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final List<Movie> searchMoviesResult;
  final String searchMoviesResultMessage;
  final RequestState searchMoviesResultState;

  SearchState({this.searchMoviesResult = const [],
    this.searchMoviesResultMessage = "",
    this.searchMoviesResultState = RequestState.loading,});

  SearchState copyWith(
      {List<Movie>? searchMovies,
      String? searchMoviesMessage,
      RequestState? searchMovieState}) {
    return SearchState(
        searchMoviesResult: searchMovies ?? this.searchMoviesResult,
        searchMoviesResultMessage: searchMoviesMessage ??
            this.searchMoviesResultMessage,
        searchMoviesResultState: searchMovieState ??
            this.searchMoviesResultState);
  }

  @override
  List<Object> get props =>
      [searchMoviesResult, searchMoviesResultMessage, searchMoviesResultState,];
}
