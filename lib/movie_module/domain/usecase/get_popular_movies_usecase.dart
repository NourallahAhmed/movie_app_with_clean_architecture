import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../../data/repository/MovieRepository.dart';
import '../entites/movie.dart';
import '../repository/BaseRepository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<Movie>{

  BaseMovieRepository baseRepository;


  GetPopularMoviesUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async{
    return await baseRepository.getPopularMovies();

  }



}