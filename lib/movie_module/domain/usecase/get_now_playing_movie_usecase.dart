import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entites/movie.dart';
import '../repository/BaseRepository.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<Movie>{

  BaseMovieRepository baseRepository;
  GetNowPlayingMoviesUseCase(this.baseRepository);


  //callable class
  /// the call function will be called directly when the constructor is created
  /// build abstract class to save the function name (( to apply the contract))
  @override
  Future<Either<Failure, List<Movie>>> call() async{
    return await baseRepository.getNowPlayingMovies();
  }



}