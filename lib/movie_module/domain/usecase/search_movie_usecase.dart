import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entites/movie.dart';
import '../repository/BaseRepository.dart';

class SearchMoviesUseCase extends BaseUseCase<List<Movie> ,SearchParameters >{

  BaseMovieRepository baseMovieRepository;


  SearchMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(SearchParameters searchParameters) async{
    var result =  await baseMovieRepository.searchMovies( searchParameters);

    return result;
  }

}


class SearchParameters extends Equatable{
  final String movieName;

  const  SearchParameters(this.movieName);

  @override
  // TODO: implement props
  List<Object?> get props => [movieName];

}
