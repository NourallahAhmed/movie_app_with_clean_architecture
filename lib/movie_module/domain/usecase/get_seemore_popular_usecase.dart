import 'package:dartz/dartz.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entites/movie.dart';
import '../repository/BaseRepository.dart';

class GetSeeMorePopularMoviesUseCase extends BaseUseCase<List<Movie> , MovieParameters>{

  BaseMovieRepository baseRepository;


  GetSeeMorePopularMoviesUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(MovieParameters movieParameters) async{
    return await baseRepository.getSeeMorePopularMovies(movieParameters);

  }
}