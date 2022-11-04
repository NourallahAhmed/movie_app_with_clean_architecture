import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie_module/domain/entites/movie_details.dart';

import '../../domain/entites/movie.dart';

/// message
/// loading
/// loaded
/// list of movies

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final String nowPlayingMessage;
  final RequestState nowPlayingState;
  final List<Movie> popularMovies;
  final String popularMessage;
  final RequestState popularState;
  final List<Movie> topRatedMovies;
  final String topRatedMessage;
  final RequestState topRatedState;



  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMessage = "",
    this.nowPlayingState = RequestState.loading,
    this.popularMovies = const [],
    this.popularMessage = "",
    this.popularState = RequestState.loading,
    this.topRatedMovies = const [],
    this.topRatedMessage = "",
    this.topRatedState = RequestState.loading,
    // this.moviesDetails = const MovieDetails(),
    // this.moviesDetailsMessage = "",
    // this.moviesDetailsState = RequestState.loading,
  });


  //copyWith --> create only one object and check if the data already exist or not if not pass new data


    MoviesState copyWith({
      List<Movie>? nowPlayingMovies,
      String? nowPlayingMessage,
      RequestState? nowPlayingState,
      List<Movie>? popularMovies,
      String? popularMessage,
      RequestState? popularState,
      List<Movie>? topRatedMovies,
      String? topRatedMessage,
      RequestState? topRatedState,
    }) {
      return MoviesState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies ,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage ,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        popularMovies: popularMovies ?? this.popularMovies ,
        popularMessage: popularMessage ?? this.popularMessage ,
        popularState: popularState ?? this.popularState,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage,
        topRatedState : topRatedState ?? this.topRatedState,
      );
    }
    @override
  List<Object> get props => [
        nowPlayingState,
        nowPlayingMovies,
        nowPlayingMessage,
        popularMovies,
        popularMessage,
        popularState,
        topRatedMovies,
        topRatedMessage,
        topRatedState,
      ];
}
