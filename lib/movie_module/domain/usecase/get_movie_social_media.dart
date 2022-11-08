import 'package:dartz/dartz.dart';
import 'package:movie_app/movie_module/domain/entites/social_media.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../repository/BaseRepository.dart';
import 'get_movie_details_usecase.dart';

class GetMovieSocialMediaUseCase extends BaseUseCase<SocialMedia ,MovieDetailsParameters >{

  BaseMovieRepository baseMovieRepository;


  GetMovieSocialMediaUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, SocialMedia>> call(MovieDetailsParameters movieDetailsParameters) async{
    print(movieDetailsParameters.movieId);
    return await baseMovieRepository.getSocialMediaIds( movieDetailsParameters);
  }

}
