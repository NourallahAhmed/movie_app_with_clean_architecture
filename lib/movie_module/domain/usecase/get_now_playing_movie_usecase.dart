import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entites/movie.dart';
import '../repository/BaseRepository.dart';

class GetNowPlayingMoviesUseCase{

  BaseMovieRepository baseRepository;
  GetNowPlayingMoviesUseCase(this.baseRepository);


  Future<Either<Failure ,List<Movie>>> getNowPlayingMovies() async{
    return await baseRepository.getNowPlayingMovies();
  }
}