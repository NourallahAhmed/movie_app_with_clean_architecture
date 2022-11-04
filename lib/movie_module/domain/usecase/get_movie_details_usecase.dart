import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/movie_module/domain/repository/BaseRepository.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entites/movie_details.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails ,MovieDetailsParameters >{

  BaseMovieRepository baseMovieRepository;


  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters movieDetailsParameters) async{
    print(movieDetailsParameters.movieId);
    return await baseMovieRepository.getMovieDetails( movieDetailsParameters);
  }

}



class MovieDetailsParameters extends Equatable{
  final int movieId;

  const  MovieDetailsParameters(this.movieId);

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];

}