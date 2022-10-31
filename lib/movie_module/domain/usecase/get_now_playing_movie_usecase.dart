import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/repository/MovieRepository.dart';
import '../entites/movie.dart';
import '../repository/BaseRepository.dart';

class GetNowPlayingMovies{

  BaseMovieRepository baseRepository;
  GetNowPlayingMovies(this.baseRepository);


  Future<Either<Failure ,List<Movie>>> getNowPlayingMovies() async{
    return await baseRepository.getNowPlayingMovies();
  }
}