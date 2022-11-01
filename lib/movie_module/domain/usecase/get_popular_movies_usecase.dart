import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/repository/MovieRepository.dart';
import '../entites/movie.dart';
import '../repository/BaseRepository.dart';

class GetPopularMoviesUseCase{

  BaseMovieRepository baseRepository;


  GetPopularMoviesUseCase(this.baseRepository);


  Future<Either<Failure ,List<Movie>>>getPopularMovies() async {
    return await baseRepository.getPopularMovies();
  }
}