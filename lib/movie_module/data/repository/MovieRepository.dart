import 'package:movie_app/core/error/Exceptions.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movie_module/data/datasource/remote_data_source.dart';
import 'package:movie_app/movie_module/domain/entites/movie.dart';
import 'package:movie_app/movie_module/domain/entites/movie_details.dart';
import 'package:movie_app/movie_module/domain/entites/movie_recomendation.dart';
import 'package:movie_app/movie_module/domain/repository/BaseRepository.dart';

import 'package:dartz/dartz.dart';

import '../../domain/usecase/get_movie_details_usecase.dart';
import '../../domain/usecase/get_movie_recommendations_usecase.dart';


class MovieRepository implements BaseMovieRepository {

  final BaseRemoteDataSource baseRemoteDataSource;


  MovieRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure ,List<Movie>>> getNowPlayingMovies() async{
    try {
      return Right(await baseRemoteDataSource.getNowPlayingMovies());
    }
    on ServiceExceptions catch (failure){
      return Left(ServerFailure(failure.errorMessage.statusMessage));
    }
}

  @override
  Future<Either<Failure ,List<Movie>>> getPopularMovies()  async {
    try {
      return Right(await baseRemoteDataSource.getPopularMovies());
    }
    on ServiceExceptions catch (failure){
      return Left(ServerFailure(failure.errorMessage.statusMessage));
    }
  }

  @override
  Future<Either<Failure ,List<Movie>>> getTopRatedMovies() async {
    try {
      return Right(await baseRemoteDataSource.getTopRatedMovies());
    }
    on ServiceExceptions catch (failure){
      return Left(ServerFailure(failure.errorMessage.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters movieDetailsParameters) async {
    try {
      return Right(await baseRemoteDataSource.getMoviesDetails(movieDetailsParameters));
    }
    on ServiceExceptions catch (failure){
    return Left(ServerFailure(failure.errorMessage.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecomendation>>> getMovieRecomendation(MovieRecomendationParameters movieRecomendationParameters) async {
    try {

      print("movieRecomendationParameters");
      print(movieRecomendationParameters.movieId);
      return Right(await baseRemoteDataSource.getMoviesRecomendations(movieRecomendationParameters));
    }
    on ServiceExceptions catch (failure){
    return Left(ServerFailure(failure.errorMessage.statusMessage));
    }
  }


}