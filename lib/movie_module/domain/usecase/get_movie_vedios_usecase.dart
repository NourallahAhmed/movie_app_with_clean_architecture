
import 'package:dartz/dartz.dart';
import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entites/movie_vedios.dart';
import '../repository/BaseRepository.dart';
import 'get_movie_details_usecase.dart';

class GetMovieVediosUseCase extends BaseUseCase<List<Movie_Vedios> ,MovieDetailsParameters >{

  BaseMovieRepository baseMovieRepository;


  GetMovieVediosUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure ,List<Movie_Vedios>>>  call(MovieDetailsParameters movieDetailsParameters) async{
    print(movieDetailsParameters.movieId);
    return await baseMovieRepository.getMovieVedios( movieDetailsParameters);
  }

}