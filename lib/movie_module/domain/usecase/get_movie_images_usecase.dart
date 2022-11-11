import 'package:dartz/dartz.dart';
import 'package:movie_app/movie_module/domain/entites/images.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../repository/BaseRepository.dart';
import 'get_movie_details_usecase.dart';

class GetMovieImagesUseCase extends BaseUseCase<List<MovieImages> ,MovieDetailsParameters >{

  BaseMovieRepository baseMovieRepository;


  GetMovieImagesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<MovieImages>>> call(MovieDetailsParameters movieDetailsParameters) async{
    print("GetMovieImagesUseCase");
    print(movieDetailsParameters.movieId);
    return await baseMovieRepository.getMovieImages( movieDetailsParameters);
  }

}
