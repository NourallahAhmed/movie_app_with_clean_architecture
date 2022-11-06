import 'package:dartz/dartz.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entites/movie.dart';
import '../repository/BaseRepository.dart';

class GetUpComingMovieUseCase extends BaseUseCase<List<Movie> , NoParameters>{

  BaseMovieRepository baseRepository;


  GetUpComingMovieUseCase(this.baseRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters) async {
    return await baseRepository.getUpComingMovies();

  }




}