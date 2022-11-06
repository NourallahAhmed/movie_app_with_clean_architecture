
import 'package:dartz/dartz.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entites/actor.dart';
import '../entites/movie.dart';
import '../repository/BaseRepository.dart';
import 'get_actor_movies_usecase.dart';

class GetActorDetailsUseCase extends BaseUseCase<Actor ,ActorDetailsParameters >{

  BaseMovieRepository baseMovieRepository;


  GetActorDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, Actor>> call(ActorDetailsParameters actorDetailsParameters) async{
    print(actorDetailsParameters.actorId);
    var result =  await baseMovieRepository.getActorDetails( actorDetailsParameters);

    return result;
  }

}