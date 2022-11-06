import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/movie_module/domain/entites/credits.dart';
import 'package:movie_app/movie_module/domain/entites/movie.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entites/movie_details.dart';
import '../repository/BaseRepository.dart';
import 'get_movie_details_usecase.dart';

class GetActorMoviesUseCase extends BaseUseCase<List<Movie> ,ActorDetailsParameters >{

  BaseMovieRepository baseMovieRepository;


  GetActorMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(ActorDetailsParameters actorDetailsParameters) async{
    print(actorDetailsParameters.actorId);
    var result =  await baseMovieRepository.getActorMovies( actorDetailsParameters);

    return result;
  }

}


class ActorDetailsParameters extends Equatable{
  final int actorId;

  const  ActorDetailsParameters(this.actorId);

  @override
  // TODO: implement props
  List<Object?> get props => [actorId];

}
