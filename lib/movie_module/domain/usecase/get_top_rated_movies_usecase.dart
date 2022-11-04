import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entites/movie.dart';
import '../repository/BaseRepository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie> , NoParameters>{

  BaseMovieRepository baseRepository;


  GetTopRatedMoviesUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters) async {
    return await baseRepository.getTopRatedMovies();

  }




}