import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/repository/MovieRepository.dart';
import '../entites/movie.dart';
import '../repository/BaseRepository.dart';

class GetPopularMovies{

  BaseMovieRepository baseRepository;


  GetPopularMovies(this.baseRepository);


  Future<Either<Failure ,List<Movie>>>getPopularMovies() async {
    return await baseRepository.getPopularMovies();
  }
}