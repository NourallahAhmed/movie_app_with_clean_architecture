import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entites/movie.dart';
import '../repository/BaseRepository.dart';

class GetTopRatedMoviesUseCase{

  BaseMovieRepository baseRepository;


  GetTopRatedMoviesUseCase(this.baseRepository);

  Future<Either<Failure ,List<Movie>>> getTopRateMovies() async {
    return await baseRepository.getTopRatedMovies();
  }
}