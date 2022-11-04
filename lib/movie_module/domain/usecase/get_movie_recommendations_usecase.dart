import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movie_module/domain/repository/BaseRepository.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_details_usecase.dart';

import '../entites/movie_recomendation.dart';

class GetMovieRecomendationsUseCase extends BaseUseCase< List<MovieRecomendation> , MovieRecomendationParameters>{
  BaseMovieRepository baseMovieRepository;

  GetMovieRecomendationsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<MovieRecomendation>>> call(MovieRecomendationParameters movieRecomendationParameters)  async{
    return await baseMovieRepository.getMovieRecomendation(movieRecomendationParameters);

  }
}

class MovieRecomendationParameters extends Equatable{
  final int movieId;

  const  MovieRecomendationParameters(this.movieId);

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];

}