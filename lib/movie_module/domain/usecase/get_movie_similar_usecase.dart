import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/movie_module/domain/entites/movie_similar.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../repository/BaseRepository.dart';

class GetMovieSimilarUseCase extends BaseUseCase< List<SimilarMovies> , MovieSimilarParameters>{
  BaseMovieRepository baseMovieRepository;

  GetMovieSimilarUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<SimilarMovies>>> call(MovieSimilarParameters movieSimilarParameters)  async{
    return await baseMovieRepository.getSimilarMovie(movieSimilarParameters);

  }
}

class MovieSimilarParameters extends Equatable{
  final int movieId;

  const  MovieSimilarParameters(this.movieId);

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];

}