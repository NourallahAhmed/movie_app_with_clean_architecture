import 'package:equatable/equatable.dart';
import 'package:movie_app/movie_module/domain/entites/genres.dart';

class MovieDetails extends Equatable{
  int id;
  String? posterPath;
  String title;
  List<Genres> genre;
  String overview;
  String releaseDate;
  double voteAverage;
  int runTime;

  MovieDetails(

      {
        required this.id,
        this.posterPath = "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
        required this.title,
        required this.genre,
        required this.overview,
        required this.releaseDate,
        required this.voteAverage,
        required this.runTime
      });

  @override
  List<Object> get props  => [
    {
      id,
      posterPath,
      title,
      genre,
      overview,
      releaseDate,
      voteAverage,
      runTime,
    }
  ];
}