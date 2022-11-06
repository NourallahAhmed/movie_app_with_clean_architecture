import 'package:dartz/dartz.dart';
import 'package:movie_app/movie_module/domain/entites/credits.dart';
import 'package:movie_app/movie_module/domain/entites/movie_details.dart';
import 'package:movie_app/movie_module/domain/entites/movie_recomendation.dart';
import 'package:movie_app/movie_module/domain/entites/movie_similar.dart';

import '../../../core/error/failure.dart';
import '../entites/movie.dart';
import '../usecase/get_actor_movies_usecase.dart';
import '../usecase/get_movie_details_usecase.dart';
import '../usecase/get_movie_recommendations_usecase.dart';
import '../usecase/get_movie_similar_usecase.dart';

abstract class BaseMovieRepository{

  //todo now playing
  Future<Either<Failure ,List<Movie>>>getNowPlayingMovies();

  //todo popular
  Future<Either<Failure ,List<Movie>>>getPopularMovies();


  //todo top rated
  Future<Either<Failure ,List<Movie>>> getTopRatedMovies();

  //todo top rated
  Future<Either<Failure ,List<Movie>>> getUpComingMovies();



  //todo movieDetails
  Future<Either<Failure ,MovieDetails>> getMovieDetails( MovieDetailsParameters movieDetailsParameters);

  //todo movieRecomendation
  Future<Either<Failure , List<MovieRecomendation>>> getMovieRecomendation( MovieRecomendationParameters movieRecomendationParameters);
  Future<Either<Failure , List<SimilarMovies>>> getSimilarMovie( MovieSimilarParameters movieSimilarParameters);
  Future<Either<Failure , Credits>> getCast( MovieDetailsParameters movieDetailsParameters);



  //todo get actor movies
  Future<Either<Failure ,List<Movie>>> getActorMovies( ActorDetailsParameters actorDetailsParameters);


  

}