import 'package:dartz/dartz.dart';
import 'package:movie_app/movie_module/domain/entites/social_media.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../repository/BaseRepository.dart';
import 'get_actor_movies_usecase.dart';

class GetPersonSocialMediaUseCase extends BaseUseCase<SocialMedia ,ActorDetailsParameters >{

  BaseMovieRepository baseMovieRepository;


  GetPersonSocialMediaUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, SocialMedia>> call(ActorDetailsParameters actorDetailsParameters) async{
    print(actorDetailsParameters.actorId);
    var result =  await baseMovieRepository.getActorSocialMedia( actorDetailsParameters);

    return result;
  }

}