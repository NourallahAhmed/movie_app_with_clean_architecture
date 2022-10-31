import 'package:equatable/equatable.dart';
import 'package:movie_app/movie_module/domain/entites/movie.dart';

class MovieModel extends Movie{
  MovieModel(
      {required super.id,
      required super.posterPath,
      required super.title,
      required super.genreIds,
      required super.overview,
      required super.releaseDate,
      required super.voteAverage});


  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
        id: map["id"],
        posterPath: map["poster_path"],
        title: map["title"],
        genreIds: List<int>.from(map["genre_ids"].map((e)=> e)),
        overview: map["overview"],
        releaseDate: map["release_date"],
        voteAverage: map["vote_average"].toDouble());
  }



}
