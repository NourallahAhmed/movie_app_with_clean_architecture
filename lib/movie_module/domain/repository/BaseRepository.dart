import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entites/movie.dart';

abstract class BaseMovieRepository{

  //todo now playing
  Future<Either<Failure ,List<Movie>>>getNowPlayingMovies();

  //todo popular
  Future<Either<Failure ,List<Movie>>>getPopularMovies();


  //todo top rated
  Future<Either<Failure ,List<Movie>>> getTopRatedMovies();

  

}