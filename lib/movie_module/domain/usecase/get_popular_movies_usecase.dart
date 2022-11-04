import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../../data/repository/MovieRepository.dart';
import '../entites/movie.dart';
import '../repository/BaseRepository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie> , NoParameters>{

  BaseMovieRepository baseRepository;


  GetPopularMoviesUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters) async{
    return await baseRepository.getPopularMovies();

  }



}