import 'package:dartz/dartz.dart';
import 'package:movie_app/movie_module/domain/entites/credits.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entites/movie_details.dart';
import '../repository/BaseRepository.dart';
import 'get_movie_details_usecase.dart';

class GetMovieCastUseCase extends BaseUseCase<Credits ,MovieDetailsParameters >{

  BaseMovieRepository baseMovieRepository;


  GetMovieCastUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, Credits>> call(MovieDetailsParameters movieDetailsParameters) async{
    print(movieDetailsParameters.movieId);
    var result =  await baseMovieRepository.getCast( movieDetailsParameters);
    print("Cast result");
    print(result);
    return result;
  }

}
